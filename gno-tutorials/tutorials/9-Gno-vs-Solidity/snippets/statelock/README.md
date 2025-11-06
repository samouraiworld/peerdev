# State Lock

Mutex pattern to prevent concurrent state modifications.

**Key Difference:** Solidity uses boolean flag with modifier, Gno uses explicit lock variable with defer for cleanup.
