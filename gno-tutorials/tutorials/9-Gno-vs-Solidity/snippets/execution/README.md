# Execution Context

Accessing transaction and caller information during execution.

**Key Difference:** Solidity uses `msg.sender` and `msg.value`, Gno uses `std.GetOrigCaller()` and `std.GetOrigSend()`.
