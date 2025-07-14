---
title: Effective Gno Best Practices
theme: ../../theme
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🚀 Effective Gno
## Best Development Practices in Gno.land 

---
layout: top-title
color: blue
---

:: title ::
# 🔄 Counter-intuitive Good Practices
:: content ::

<v-switch>
<template #0>

### 🌐 Embrace Global Variables in Realms
* Global variables = persistent state storage
* Automatically persisted between executions
* **But**: Never export them directly!
* Use getters/setters for controlled access:
```go
var counter int
func GetCounter() int { return counter }
func IncCounter() { counter++ }
```

</template>

<template #1>

### 🚨 Embrace panic()
* Use instead of error returns for critical failures
* Halts execution and rolls back transaction
* Prevents invalid state changes
```go
func Transfer(amount int) {
    if amount <= 0 {
        panic("invalid amount")
    }
    // ...
}
```

</template>

<template #2>

### init() is Crucial
* Acts as realm constructor
* Executed once during deployment
* Sets initial state and registers realms
```go
var admin std.Address
func init() {
    admin = std.OriginCaller()
}
```

</template>

<template #3>

### 📦 Prefer Small Dependencies
* Unlike Go's "little copying" philosophy
* Reuse audited, community-vetted packages
* Builds trust through composability:
```go
import (
    "gno.land/p/finance/tokens"
    "gno.land/p/utils/permissions"
)
```

</template>
</v-switch>

---
layout: top-title
color: green
---

:: title ::
# 📝 Documentation & Design
:: content ::

### 📖 Documentation is for Users
* Write for end-users, not just developers
* Include clear endpoint explanations
```go
// Transfer moves tokens between accounts
// - to: recipient address
// - amount: positive integer
func Transfer(to std.Address, amount int) {
    // ...
}
```

---
layout: top-title
color: green
---

:: title ::
# 📝 Documentation & Design
:: content ::

### 🧱 Design Realms as Public APIs
* Treat all exposed functions as public endpoints
* Validate all inputs
* Use private functions for internal logic
```go
func PublicMethod() {
    validateCaller()
    privateLogic()
}
```

---
layout: top-title
color: purple
---

:: title ::
# 🔐 Security & Access Control
:: content ::

<v-switch>
<template #0>

### 👮 Contract-level Access Control
* Use `std.PreviousRealm()` for immediate caller
* Use `std.OriginCaller()` for transaction signer
* Store admin addresses in state
```go
var admins = map[std.Address]bool{}

func AdminAction() {
    if !admins[std.PreviousRealm()] {
        panic("unauthorized")
    }
}
```

</template>

<template #1>

### 🛡️ Construct "Safe" Objects
* Objects that enforce their own security
* Protect internal state
* Can be shared between realms
```go
type SafeVault struct {
    balance int
    owner   std.Address
}

func (v *SafeVault) Withdraw(amount int) {
    if std.PreviousRealm() != v.owner {
        panic("unauthorized")
    }
    // ...
}
```

</template>
</v-switch>

---
layout: top-title
color: teal
---

:: title ::
# 💾 State Management
:: content ::

### 🌳 Use avl.Tree for Large Datasets
* Efficient key-value storage
* Lazy loading reduces gas costs
* Ideal for large collections
```go
import "avl"

var users avl.Tree

func GetUser(id string) *User {
    return users.Get(id).(*User)
}
```

---
layout: top-title
color: teal
---

:: title ::
# 💾 State Management
:: content ::


### 📡 Emit Events for Off-chain Use
* Indexable by external services
* Key-value format for filtering
```go
func Transfer(to std.Address, amount int) {
    std.Emit("Transfer", 
        "from", std.PreviousRealm().String(),
        "to", to.String(),
        "amount", strconv.Itoa(amount))
}
```

---
layout: top-title
color: orange
---

:: title ::
# 💰 Token Strategies
:: content ::

### ⚖️ Coins vs GRC20 Tokens

| **Feature**       | **Coins**                 | **GRC20 Tokens**          |
|-------------------|---------------------------|---------------------------|
| **Management**    | Banker module             | Smart contract            |
| **IBC Support**   | ✅ Yes                    | ❌ Not yet                |
| **Flexibility**   | Limited                   | High (custom logic)       |
| **Gas Costs**     | Lower                     | Higher                    |
| **Use Cases**     | Native currency, IBC      | DeFi, DAOs, token-gating  |

---
layout: top-title
color: orange
---

:: title ::
# 💰 Token Strategies
:: content ::


### 🎁 Wrapping Coins
```go
import "gno.land/p/demo/grc20"

// Wrap native coins into GRC20-compatible token
var wrappedCoin = grc20.NewBanker("Wrapped Coin", "WRAP", 6)
```

---
layout: top-title
---

:: title ::
# 📦 Package Structure Best Practices
:: content ::


### 📜 Key Rules
1. Match package name to directory name
2. Define interfaces and types in `p/`
3. Keep realms in `r/` focused on business logic
4. Use `internal/` for private packages
5. Prefer small, focused packages

---

# 🏁 Conclusion

- ✅ Embrace Gno-specific patterns
- ✅ Prioritize security and access control
- ✅ Design for users and composability
- ✅ Choose appropriate storage solutions
