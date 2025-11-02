# Gno vs Solitidy

Show all famous Solidity patern in Gno.land for an easy on-boarding for experienced Solitidy Developper.

- Introduction: This is oriented for Solidity developper
- Explain what is Gno
- Gno vs Solitidy (language + interpreter / compiler)
- Show famous Solitidy patern in Gno.land -- Helped by Gno documentation


## Basic contract example
- Basic Counter
- Blog
- DAO


## List of famous Solitidy Patern
- Ownable / Access restriction
- State Lock -- Lock the contract to do certain action depending on a state (open, close, ...)
- Emit Events -- Alows events to be emitted for off-chain tooling
- Factory -- Allows creation of multiple contract dynamically
- Token (ERC20)
- Reentrency attack prevention
- Wallet
    - Withdraw -- Pull funds from smart contract
    - Transfer -- Send funds to smart contract

Others I've in mind:
- Mapping (kind of like Avl-tree) -- abstraction storage of hash map - key -> value
- Guard Check - list of verification / restriction before running action
- Proxy Pattern -- upgradable smart contract
- Emergency Stop -- block execution of a function in case of a known exploit
- Speed Bump -- delay between action to mitigate attack

