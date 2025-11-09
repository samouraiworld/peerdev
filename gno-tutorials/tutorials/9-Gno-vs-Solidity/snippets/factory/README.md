# Factory Pattern

Creating new contract instances dynamically.

**Key Difference:** Solidity uses `new` keyword for contract creation, Gno uses registry pattern (dynamic realm creation not supported).

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 4 gno

# Test Solidity version
./test-snippets.sh 4 sol
```
