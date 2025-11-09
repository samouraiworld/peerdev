# Events

Event emission and logging for tracking contract activities.

**Key Difference:** Solidity uses `event` keyword and `emit`, Gno uses `std.Emit()` with key-value pairs.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 3 gno

# Test Solidity version
./test-snippets.sh 3 sol
```
