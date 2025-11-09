# Proxy Pattern

Upgradeable contract pattern using proxy delegation.

**Key Difference:** Solidity uses `delegatecall` for proxy, Gno uses direct realm calls (limited upgradeability).

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 9 gno

# Test Solidity version
./test-snippets.sh 9 sol
```
