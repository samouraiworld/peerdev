# Guard Check

Input validation and require statements for security checks.

**Key Difference:** Solidity uses `require()` with error messages, Gno uses `panic()` for assertion failures.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 5 gno

# Test Solidity version
./test-snippets.sh 5 sol
```
