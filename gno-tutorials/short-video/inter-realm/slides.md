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
Added in master.2250

Define what a realm is: isolated state and logic. 
Highlight benefits like security, traceability, and logical isolation. 
This sets the foundation for understanding interrealm behavior.
-->

---

# What is a Realm?

* A **realm** is an isolated execution and storage context 🌍
* Each realm has:
  - Its own **state and authority**
  - Rules for **entry** and **data modification**
* Realms enforce:
  - **Security**, **Traceability** and **Isolation** 

```mermaid 
flowchart TD
  subgraph Realm_A["Realm A"]
    D1[Global Data]
    L1[Local State]
  end
```
 <!-- 
Show how realm A can call into realm B. Emphasize the layered provenance stack.

Realms are like smart contract containers — fully isolated and self-governed.
Think secure micro world.
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
        B[Called from: **A**]
        C[Origin: **User Realm**]
```

---

# Interrealm Flow

### Package method call
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
```mermaid
sequenceDiagram
  participant User as User Contract
  participant Target as Target Contract
  participant Malicious as Malicious Contract

  User->>Target: Send Funds (1 ETH)
  activate Target
  Target->>Malicious: Call External Function
  activate Malicious
  Malicious->>Target: Reenter (1 ETH)
  Target->>Malicious: Call External Function
  Note right of Malicious: Loop continues...
  deactivate Malicious
  deactivate Target
```

---

# Let's introduce **Borrowing**
### Less permissive call for a more secure environment.

* **Borrowing** = calling a method on an object in another realm.
* You **implicitly visit** the object's realm for that method call.
* You can **read and modify** the receiver and its reachable state.
* **Limit**: You cannot freely create new root-level objects.

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
* **Crossing** = `cross(fn)(...)` or functions marked with `crossing()`.
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
func CallCreatePost(title, content string) {
    CreatePost(title, content)
}
```
```go
func CallCreatePost(title, content string) {
    cross(CreatePost)(title, content)
}
```
````

#### Realm B
````md magic-move
```go
func CreatePost(title, content string) {
	newPost := Post{
		Title: title,
        Content: content,
	}
	Posts = append(Posts, *newPost)
}
```
```go
func CreatePost(title, content string) {
    crossing()
	newPost := Post{
		Title: title,
        Content: content,
	}
	Posts = append(Posts, *newPost)
}
````
---

# Rules Summary

| Action                        | Borrowing                 | Crossing                        |
| ----------------------------- | ------------------------- | ------------------------------- |
| Modify existing object        | ✅ via method call         | ✅                               |
| Create new unattached object  | ❌                         | ✅                               |
| Implicit realm context change | No (temporary for method) | Yes (permanent inside fn)       |
| Method syntax                 | `obj.Method()`            | `cross(fn)(...)` + `crossing()` |

---

# Code Example: Borrowing

```go
// In realmB
func (b *Book) SetTitle(new string) {
  b.Title = new  // Allowed: borrowing b’s realm
}

// In realmA
book := &realmB.Book{}
book.SetTitle("Hello Gno")
```

---

# Code Example: Crossing

```go
// In realmB
func CreateUser(name string) {
  crossing()
  user := &User{Name: name}
  users[name] = user  // Global storage in realmB
}

// In realmA
cross(realmB.CreateUser)("alice")
```

---

# Best Practices

1. Default to **non-crossing** methods.
2. Use **borrowing** for object-specific ops.
3. Reserve **crossing** for realm-level state changes.
4. Always mark public crossable functions with `crossing()`.

---

# Summary

* **Realms** = isolated worlds.
* **Borrowing** = temporary, object-scoped access.
* **Crossing** = explicit realm switch for full access.
* Choose the right approach for **security** and **clarity**.
