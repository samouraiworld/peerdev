---
title: Gno vs Solidity - Smart Contract Patterns
theme: ../../theme
colorSchema: teal
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🔄 Gno vs Solidity
## Smart Contract Patterns for Solidity Developers

Bridging the gap between Ethereum and Gno.land

<!--
This presentation helps experienced Solidity developers transition to Gno.land by showing familiar patterns
-->

---

# 👋 Who is this for?

## Target Audience:
- **Experienced Solidity Developers**
- Ethereum smart contract developers
- Web3 developers looking to expand to Gno.land
- Anyone familiar with EVM-based development

## What you'll learn:
- How Gno compares to Solidity
- Common patterns translated from Solidity to Gno
- Best practices for Gno development

<!--
This is specifically designed for developers with Solidity experience
-->

---

# 🌐 What is Gno?

**Gno** is a blockchain platform using **Go-based smart contracts**

#### Key Features:
- **Language**: Based on Go (Golang)
- **Paradigm**: Interpreted, not compiled to bytecode
- **Type System**: Strong static typing
- **Concurrency**: Deterministic (no goroutines in contracts)
- **Storage**: Persistent state with realms

#### Philosophy:
Write smart contracts in a **familiar, readable language** (Go) instead of learning Solidity from scratch

<!--
Gno brings the simplicity and readability of Go to blockchain development
-->

---

# ⚔️ Gno vs Solidity: Language

| Feature | Solidity | Gno |
|---------|----------|-----|
| **Base Language** | Custom | Go (Golang) |
| **Execution** | Compiled to bytecode | Interpreted |
| **Type System** | Static | Static (Go-based) |
| **Inheritance** | Yes (OOP) | No (composition) |
| **Interfaces** | Yes | Yes (Go interfaces) |
| **Error Handling** | `require`, `revert` | `panic`, `error` returns |
| **Gas Model** | EVM gas | Gno gas |

<!--
Both are statically typed but Gno uses familiar Go syntax and patterns
-->

---

# 📦 Pattern 1: Basic Counter

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/counter/counter-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/counter/counter-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🔒 Pattern 2: Private vs Public

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/private-vs-public/visibility-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/private-vs-public/visibility-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# �🔒 Pattern 3: Ownable / Access Control

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/ownable/ownable-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/ownable/ownable-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🔐 Pattern 4: State Lock

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/statelock/statelock-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/statelock/statelock-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🗺️ Pattern 5: Mapping (AVL Tree)

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/mapping/mapping-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/mapping/mapping-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 📢 Pattern 6: Emit Events

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/events/events-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/events/events-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🏭 Pattern 7: Factory Pattern

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/factory/factory-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/factory/factory-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 💰 Pattern 8: Token (ERC20 → GRC20)

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity (ERC20)

<<< @/snippets/erc20-grc20/erc20-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno (GRC20)

<<< @/snippets/erc20-grc20/grc20-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🛡️ Pattern 9: Reentrancy Guard

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/reentrancy/reentrancy-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/reentrancy/reentrancy-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 💸 Pattern 10: Wallet - Withdraw

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/wallet-withdraw/wallet-withdraw-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/wallet-withdraw/wallet-withdraw-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 💸 Pattern 11: Wallet - Deposit

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/wallet-deposit/wallet-deposit-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/wallet-deposit/wallet-deposit-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---


---

# ✅ Pattern 12: Guard Check

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/guardcheck/guardcheck-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/guardcheck/guardcheck-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🔄 Pattern 13: Proxy Pattern

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/proxy/proxy-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/proxy/proxy-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🚨 Pattern 14: Emergency Stop

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/emergency/emergency-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/emergency/emergency-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# ⏱️ Pattern 15: Speed Bump

<div class="grid grid-cols-2 gap-4">
<div>

## Solidity

<<< @/snippets/speedbump/speedbump-solidity.sol solidity {all}{maxHeight:'350px'}

</div>
<div>

## Gno

<<< @/snippets/speedbump/speedbump-gno.gno go {all}{maxHeight:'350px'}

</div>
</div>

---

# 🗝️ Key Differences Summary


| Solidity | Gno |
|----------|-----|
| `msg.sender` | `std.PrevRealm().Addr()` |
| `require()` | `if !condition { panic() }` |
| `modifier` | Function calls with `Assert*()` |
| `mapping` | `avl.Tree` |
| `emit Event` | `emit.Emit()` |
| `contract` | `package` + `realm` |
| `constructor` | `init()` function |
| `payable` | `std.GetOrigSend()` |

---

# 🎯 Best Practices for Gno

## Coming from Solidity:

1. **Think packages, not contracts** - Gno uses Go packages
2. **Use composition over inheritance** - No OOP inheritance
3. **Leverage Go's standard library** - Familiar Go patterns work
4. **AVL trees for mappings** - Efficient key-value storage
5. **Panic for errors** - Or return `error` types
6. **Realms are stateful** - Persistent state across calls
7. **No dynamic dispatch** - Static linking at deploy time

<!--
Embrace Go patterns and idioms for cleaner Gno code
-->

---

# 📚 Resources

## Learning More:

- **Gno Documentation**: [docs.gno.land](https://docs.gno.land)
- **Gno by Example**: [gno.land/r/demo](https://gno.land/r/demo)
- **Standard Library**: `gno.land/p/demo/*`
- **Example Realms**: `gno.land/r/demo/*`

## Key Packages:
- `gno.land/p/demo/avl` - AVL tree (like mapping)
- `gno.land/p/demo/ownable` - Ownership pattern
- `gno.land/p/demo/grc/grc20` - Token standard

---

# 🚀 Getting Started

## Next Steps:

1. **Set up Gno development environment**
2. **Clone and explore example realms**
3. **Start with simple counter or blog**
4. **Gradually implement familiar patterns**
5. **Join the Gno community**

## Remember:
- Gno is **Go** - if you know Go, you're 80% there
- Patterns are **similar** - just different syntax
- Community is **helpful** - ask questions!

<!--
Welcome to the Gno ecosystem! Your Solidity knowledge transfers well.
-->
