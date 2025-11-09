# Speed Bump

Time-based delays for sensitive operations.

**Key Difference:** Solidity uses `block.timestamp`, Gno uses `time.Now()` for time-based logic.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 11 gno

# Test Solidity version
./test-snippets.sh 11 sol
```
