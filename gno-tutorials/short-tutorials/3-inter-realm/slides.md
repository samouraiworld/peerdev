---
theme: neversink
paginate: true
title: Interrealm in Gno
coverBackgroundUrl: 'images/hero-background.svg'
mdc: true
aspectRatio: 16/9
---

# Interrealm in Gno 🌐

A deep dive into Gno’s realm system and rules

<!--
Interrealm is a specification in Gno that add a synthax to explicit the realm context modification.
It protects users by avoiding implicit realm scope modification, that could led to unseen reentrency attack.
Let's see what is it, highlight the security benifits and understand the interrealm behavior.

Added in master.2250
-->

---

# What is a Realm?

* A **Realm** is an isolated mutable state space within the GnoVM
* Each realm:
  - Owns its global variables (storage)
  - Controls mutation access through realm context
  - Has a dedicated coin address

<div class="grid grid-cols-2 gap-4">

<div>

```mermaid 
flowchart TD
  subgraph Realm["Realm"]
    D1[Public Function]
    L1[Local State]
  end
```

</div>

<div>

```mermaid 
flowchart TD
  subgraph Package["Pure Package"]
    D1[Public Function]
  end
```

</div>

</div>

 <!-- 
Multi-context virtual machine
Each realm is fully isolated and self-governed, like a container.

You would need to do a context change, which can be compared to machine context in distributed computing.

 --> 

---

# Interrealm Flow

### Realm method call

```mermaid
flowchart LR
  subgraph User Realm
    U[User Realm]
  end
  subgraph Realm A
    A[Realm A]
  end
  subgraph Realm B
    B[Realm B]
  end

  U -- params --> A
  A -- params --> B
  B -- result --> A
  A -- return --> U
```

```mermaid
kanban
  column1[Provenance stack]
        Top[Current Realm: **B**]
        B[Previous Realm: **A**]
        C[Origin: **User Realm**]
```

---

# Interrealm Flow

### Pure Package method call
```mermaid
flowchart LR
  subgraph User Realm
    U[User Realm]
  end
  subgraph Realm A
    A[Realm A]
    B[Package]
  end

  U ----> A
  A -- Method call --> B
  B ----> A
  A ----> U
```

```mermaid
kanban
  column1[Provenance stack]
        Top[Current Realm: **A**]
        C[Origin: **User Realm**]
```

---

# But it instaure crucial flaw - Reentrency attack

```mermaid {scale: 0.8}
sequenceDiagram
  participant User as User (EOA)
  participant Target as Vulnerable Contract
  participant Malicious as Malicious Contract

  User->>Malicious: 1. Call attack()
  activate Malicious
  Malicious->>Target: 2. withdraw() 
  activate Target
  Target->>Malicious: 3. Send GNOT (triggers fallback)
  activate Malicious
  Malicious->>Target: 4. withdraw() [Reentrant Call]
  activate Target
  Target->>Malicious: 5. Send GNOT (again)
  activate Malicious
  Note right of Malicious: 6. Reentrancy loop continues...
  Malicious-->>Target: 
  deactivate Malicious
  deactivate Target
  Malicious-->>Target: 
  deactivate Malicious
  deactivate Target
  Malicious-->>User: 7. Attack complete
  deactivate Malicious
```

---

# Let's introduce **Borrowing**
### Less permissive call for a more secure environment.

* **Borrowing** = calling a method on an external realm's object
* You temporarily enter the object's storage realm
* You can modify:
  - The receiver object itself
  - Objects reachable from receiver (same realm)
* **Cannot** create new root-level objects

---

# Interrealm Flow (Borrowing)

```mermaid
flowchart LR
  subgraph User Realm
    U[User Realm]
  end
  subgraph Realm A
    A[Realm A]
    B[Realm B]
  end

  U -- cross(fn) --> A
  A -- Method call (Borrowing) --> B
  B -- result --> A
  A -- return --> U
```

```mermaid
kanban
  column1[Provenance stack]
        Top[Current Realm: **A**]
        C[Origin: **User Realm**]
```


---

# Crossing

* **Explicitly switch** into another realm.
* **Crossing** = `cross(fn)(...)`.
* Gain full **write access** to the realm’s global storage like it used to.
* Use for **creating new objects** or performing realm-specific logic.

---


# Interrealm Flow (Crossing)

```mermaid
flowchart LR
  subgraph User Realm
    U[User Realm]
  end
  subgraph Realm A
    A[Realm A]
  end
  subgraph Realm B
    B[Realm B]
  end

  U -- cross(fn)(val) --> A
  A -- cross(fn)(val) --> B
  B -- result --> A
  A -- return --> U
```

```mermaid
kanban
  column1[Provenance stack]
        Top[Current Realm: **B**]
        B[Called from: **A**]
        C[Origin: **User Realm**]
```
---

# Inter-realm Flow (Crossing)

#### Realm A
````md magic-move
```go
realmB.CreatePost("Hello Gno")
```
```go
realmB.CreatePost(cross, "Hello Gno")
```
````

#### Realm B
````md magic-move
```go
func CreatePost(title string) {
	newPost := Post{
		Title: title,
  }
	Posts = append(Posts, *newPost)
}
```
```go
func CreatePost(cur realm, title string) {
	newPost := Post{
		Title: title,
  }
	Posts = append(Posts, *newPost)
}
```
````
---

# Rules Summary

| Action                        | Borrowing                 | Crossing                        |
| ----------------------------- | ------------------------- | ------------------------------- |
| Modify existing object        | ✅ via method call         | ✅                               |
| Create new unattached object  | ❌                         | ✅                               |
| Implicit realm context change | No (temporary for method) | Yes (permanent inside fn)       |
| Method syntax                 | `obj.Method()`            | `cross(fn)(...)` + `cur realm` parameter |

---

# Code Example
## Borrowing

```go
// In realmB
func (b *Book) SetTitle(new string) {
  b.Title = new  // Allowed: borrowing b’s realm
}

// In realmA
book := &realmB.Book{}
book.SetTitle("Hello Gno")
```

## Crossing

```go
// In realmB
func CreateUser(cur realm, name string) {
  user := &User{Name: name}
  users[name] = user  // Global storage in realmB
}

// In realmA
realmB.CreateUser(cross, "alice")
```
---

# Summary

* **Realms** = isolated code.
* **Borrowing** = temporary, limited scoped access 
* **Crossing** = explicit realm switch for full access 
* Choose the right approach for **security** and **clarity**.

