# Reentrancy Protection

Guard against reentrancy attacks in external calls.

**Key Difference:** Solidity uses ReentrancyGuard with `nonReentrant` modifier, Gno uses boolean lock with explicit checks.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 10 gno

# Test Solidity version
./test-snippets.sh 10 sol
```
