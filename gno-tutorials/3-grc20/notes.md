Goal : Build a grc20 token + banker / coins module

# GRC20 vs Coins

Coins -> Exchange gnot -> Another currency
https://docs.gno.land/resources/gno-stdlibs/#banker
The Banker's main purpose is to handle balance changes of native coins within Gno chains. This includes issuance, transfers, and burning of coins.

Explain use case

Comparaison vs the two

Coins more centralized ?

GRC20 token
Like ERC20 / CW20
ERC721 NFT

Why ERC20 ?


# Basic
TotalSupply / BalanceOf

Transfer

Allowance / Approve / TransferFrom

Faucet / Mint / Burn

# Explain concept of GRC20 

token-gating, vaults, and wrapping.


Token gating : Block the access of a service withouth a NFT -- For exclusive Content

Vaults: Deposit ERC20 -> Shares of that token, to earn Yield

wrapping: GRC20{Coins}

# source
https://gno.land/r/demo/foo20
https://gno.land/r/demo/bar20


# Use case

Lending Borrowing Platform

Alice has 10 Coins

She want to lend them to get interest

Bob want to borrow Coins to invest, and give some collateral in exchange (10 gnot for 10 ETH)

Alive get Lending Token as a receipt




A common use case for ERC-20 tokens is in **decentralized finance (DeFi)** applications. Here's an example of how it works:

### Use Case: **Decentralized Lending and Borrowing Platform**

Imagine a decentralized lending platform where users can lend and borrow cryptocurrencies. Here's how ERC-20 tokens would fit into the process:

1. **Lending Process**:

   * A user (let’s call them Alice) wants to lend some of her cryptocurrency to earn interest.
   * Alice deposits an ERC-20 token (such as DAI, a stablecoin) into the lending platform’s smart contract.
   * The smart contract holds her DAI in a decentralized way and issues a corresponding amount of **lending tokens** (which are also ERC-20 tokens) as a receipt for her deposit. These lending tokens represent her claim to the funds she has lent out.

2. **Borrowing Process**:

   * Another user (Bob) needs a loan and offers to use some collateral in exchange.
   * Bob borrows DAI (or another ERC-20 token) from the pool by locking up collateral (for example, ETH).
   * The lending platform provides Bob with DAI tokens (which are ERC-20 tokens) to use as loan funds. The platform uses smart contracts to enforce repayment and interest rates.

3. **Repayment**:

   * Bob repays the loan with interest. Once the loan is repaid, Bob’s collateral is returned.
   * Alice, as a lender, can redeem her lending tokens (which are also ERC-20 tokens) for the original DAI she deposited, along with any earned interest.

In this case, ERC-20 tokens like **DAI**, **USDT**, or **ETH** (wrapped as ERC-20) are used as the primary units of exchange within the lending and borrowing platform. The tokens follow the ERC-20 standard, meaning they can be easily integrated with various decentralized platforms, wallets, and applications.

This flexibility makes ERC-20 tokens a fundamental part of the DeFi ecosystem.

---
Teller
// Teller interface defines the methods that a GRC20 token must implement. It
// extends the TokenMetadata interface to include methods for managing token
// transfers, allowances, and querying balances.
//
// The Teller interface is designed to ensure that any token adhering to this
// standard provides a consistent API for interacting with fungible tokens.

PrivateLedger
// PrivateLedger is a struct that holds the balances and allowances for the
// token. It provides administrative functions for minting, burning,
// transferring tokens, and managing allowances.
//
// The PrivateLedger is not safe to expose publicly, as it contains sensitive
// information regarding token balances and allowances, and allows direct,
// unrestricted access to all administrative functions.

Token
// Token represents a fungible token with a name, symbol, and a certain number
// of decimal places. It maintains a ledger for tracking balances and allowances
// of addresses.
//
// The Token struct provides methods for retrieving token metadata, such as the
// name, symbol, and decimals, as well as methods for interacting with the
// ledger, including checking balances and allowances.


type TokenMetadata interface {
	// Returns the name of the token.
	GetName() string

	// Returns the symbol of the token, usually a shorter version of the
	// name.
	GetSymbol() string

	// Returns the decimals places of the token.
	GetDecimals() uint
}


Teller -> Interface to implement for GRC20 in our own realm

PrivateLedger -> Struct that manage the personal balance
Always the same

Token Metadata


const (
	MintEvent     = "Mint"
	BurnEvent     = "Burn"
	TransferEvent = "Transfer"
	ApprovalEvent = "Approval"
)

// IMPORTANT: Beware that changing an allowance with this method brings
	// the risk that someone may use both the old and the new allowance by
	// unfortunate transaction ordering. One possible solution to mitigate
	// this race condition is to first reduce the spender's allowance to 0
	// and set the desired value afterwards:
	// https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
	Approve(spender std.Address, amount uint64) error
