# Wallet Deposit

Accepting and tracking incoming token/coin deposits.

**Key Difference:** Solidity uses `payable` functions with `msg.value`, Gno uses `std.GetOrigSend()` to receive coins.

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 13 gno

# Test Solidity version
./test-snippets.sh 13 sol
```
