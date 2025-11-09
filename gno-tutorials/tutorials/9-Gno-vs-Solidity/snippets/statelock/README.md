# State Lock

Mutex pattern to prevent concurrent state modifications.

**Key Difference:** Solidity uses boolean flag with modifier, Gno uses explicit lock variable with defer for cleanup.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 12 gno

# Test Solidity version
./test-snippets.sh 12 sol
```
