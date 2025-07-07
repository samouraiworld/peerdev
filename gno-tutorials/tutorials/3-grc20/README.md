# GRC20 vs Native Coins on Gno.land

This guide explains the key differences between native coins and GRC20 tokens in the Gno ecosystem, their use cases, and implementation considerations.

## Table of Contents
1. [Native Coins](#native-coins)
2. [GRC20 Tokens](#grc20-tokens)
3. [Key Differences](#key-differences)
4. [Use Cases](#use-cases)
5. [Implementation](#implementation)
6. [Resources](#resources)

## Native Coins
Native coins are the fundamental currency type in Gno.land, managed by the built-in `banker` module.

**Characteristics:**
- ✅ Native to the blockchain (not implemented in smart contracts)
- ✅ Extremely gas-efficient with minimal overhead
- ✅ Used for staking, transaction fees, and IBC transfers
- ❌ No custom logic or programmable behavior
- ❌ Limited composability with dApps

**Core functionality:**
```go
banker.SendCoins(from, to, coins)
banker.IssueCoin(addr, denom, amount)
banker.RemoveCoin(addr, denom, amount)
coins := banker.GetCoins(addr)
```

**Best for:**  
Base-layer transactions, staking mechanisms, fee payments, and cross-chain transfers.

## GRC20 Tokens
GRC20 is Gno's equivalent of ERC20/CW20 - a fungible token standard implemented as smart contracts (realms).

**Characteristics:**
- ✅ Fully programmable with custom logic
- ✅ Supports complex DeFi operations and token mechanics
- ✅ Composable with other smart contracts
- ⚠️ Slight performance overhead compared to native coins
- ⚠️ Stored and executed in realms (not native to chain)

**Core functionality:**
```go
func Mint(to std.Address, amount uint64) {}
func Transfer(to std.Address, amount uint64) {}
func BalanceOf(owner std.Address) uint64 {}
func Approve(spender std.Address, amount uint64) {}
```

## Key Differences
| Feature             | Native Coins | GRC20 Tokens       |
|---------------------|--------------|--------------------|
| Native to chain     | ✅           | ❌                 |
| Custom Logic        | ❌           | ✅                 |
| dApp Composability  | Limited      | ✅                 |
| Gas Efficiency      | ✅ High      | ⚠️ Moderate        |
| IBC Readiness       | ✅           | ❌ (Requires wrap) |
| Implementation      | Banker module| Smart Contract     |

## Use Cases

### When to use Native Coins
- Staking mechanisms
- Transaction fee payments
- Cross-chain transfers (IBC)
- Simple currency systems
- Base-layer accounting

### When to use GRC20 Tokens
1. **Token Gating**  
   Control access to content/features based on token ownership:
   ```go
   if BalanceOf(user) > 0 {
       // Grant access
   }
   ```

2. **DeFi Vaults**  
   Create yield-bearing instruments:
   ```go
   func Deposit(amount uint64) {
       SafeTransferFrom(user, vault, amount)
       shares := amount * pricePerShare
       _mint(user, shares)
   }
   ```

3. **Wrapped Assets**  
   Make native coins compatible with DeFi:
   ```go
   func DepositNative() {
       nativeCoins := banker.GetCoins(caller)
       banker.RemoveCoin(caller, "ugnot", amount)
       _mint(caller, amount) // Mint wGNOT tokens
   }
   ```

4. **Governance Tokens**  
   Implement voting rights and DAOs

5. **Lending Protocols**  
   Create interest-bearing tokens (e.g., aTokens)

## Implementation

### Native Coin Creation
```go
// Create new coin type
newCoin := Coin{Denom: "APP", Amount: 1000000}

// Issue to address
banker.IssueCoin(targetAddress, "APP", 1000000)
```

## Resources
- [Banker Module Documentation](https://docs.gno.land/resources/gno-stdlibs/#banker)
- [Coin Type Documentation](https://docs.gno.land/resources/gno-stdlibs/#coin)
- [Choosing Between Coins and GRC20](https://docs.gno.land/resources/effective-gno/#choosing-between-coins-and-grc20-tokens)
- [foo20 Example Contract](https://gno.land/r/demo/foo20)
- [bar20 Example Contract](https://gno.land/r/demo/bar20)
