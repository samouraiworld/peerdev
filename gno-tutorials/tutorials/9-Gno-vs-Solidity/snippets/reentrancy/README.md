# Reentrancy Protection

Guard against reentrancy attacks in external calls.

**Key Difference:** Solidity uses ReentrancyGuard with `nonReentrant` modifier, Gno uses boolean lock with explicit checks.
