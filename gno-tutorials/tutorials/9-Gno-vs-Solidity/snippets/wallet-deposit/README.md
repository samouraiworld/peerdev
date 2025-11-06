# Wallet Deposit

Accepting and tracking incoming token/coin deposits.

**Key Difference:** Solidity uses `payable` functions with `msg.value`, Gno uses `std.GetOrigSend()` to receive coins.
