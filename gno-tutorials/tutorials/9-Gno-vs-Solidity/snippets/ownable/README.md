# Ownable

Ownership pattern for access control and administrative functions.

**Key Difference:** Solidity uses `modifier onlyOwner`, Gno uses `std.PrevRealm()` for caller verification.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 7 gno

# Test Solidity version
./test-snippets.sh 7 sol
```
