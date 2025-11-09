# Private vs Public

Visibility modifiers and access control patterns.

**Key Difference:** Solidity uses `public`, `private`, `internal`, `external` keywords. Gno uses capitalization (uppercase = public, lowercase = private).

## Testing

Run from the tutorial root directory:
```bash
# Test Gno version
./test-snippets.sh 15 gno

# Test Solidity version
./test-snippets.sh 15 sol
```


**Important:** "Private" means not callable/exported, NOT secret. All blockchain data is readable on-chain.

