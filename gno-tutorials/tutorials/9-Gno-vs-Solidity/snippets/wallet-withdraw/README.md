# Wallet Withdraw

Secure withdrawal mechanism for tokens/coins.

**Key Difference:** Solidity uses `.transfer()` or `.call{value: amount}()`, Gno uses banker for sending coins.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 14 gno

# Test Solidity version
./test-snippets.sh 14 sol
```
