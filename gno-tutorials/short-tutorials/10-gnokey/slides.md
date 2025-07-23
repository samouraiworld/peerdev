---
title: Interact with Gnokey CLI
theme: neversink
colorSchema: teal
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🛠️ Interact with Gnokey
## The Command-Line Interface for Gno.land

Essential commands to manage keys and transactions

Working with local and remote signers

<!--
Gnokey is the primary CLI tool for interacting with the Gno chain
It handles key management, transaction signing, and querying
-->

---

# 🔑 Key Management Basics

<div class="grid gap-4 mt-4">

```bash {all|1|2|3|all}
gnokey add mykey                  # Create new key
gnokey add mykey --recover        # Recover from mnemonic
gnokey list                       # List all local keys
```

</div>

<div class="mt-6 bg-blue-50 p-4 rounded-xl border-l-4 border-blue-400 shadow-sm">
🔐 <strong>Key Storage</strong><br>
Keys are stored in <code>~/.gnokey/</code> by default<br>
Secured with passphrase encryption
</div>

<!--
Key management is the foundation of blockchain interaction
All transactions require cryptographic signatures
-->

---
layout: top-title
color: sky-light
---

:: title ::
# 🔄 Working with Remote Signers
:: content ::

Connect to remote key management services:

```bash {1|2|3}
gnokey add remotesigner --remote gno.land:26657
gnokey add ledgerkey --ledger
gnokey add multisig --multisig thresh=2,keys=key1,key2
```

<div class="mt-4 bg-amber-50 p-4 rounded-xl border-l-4 border-amber-400 shadow-sm">
⚠️ <strong>Security Note</strong><br>
Remote signers never expose private keys locally<br>
Ideal for high-security environments
</div>

---
layout: default
---

# 💰 Managing Coins

## Query Balances

```bash
gnokey query auth/accounts/<address> \
  --remote gno.land:26657
```

## Send Transactions

```bash {1|1-2|1-3|1-4}
gnokey maketx send --to g1xyz... --send 100ugnot \
  --chain-id testchain --remote gno.land:26657 \
  --gas-fee 1ugnot --gas-wanted 200000 \
  mykey | gnokey broadcast -
```

<!--
Breakdown:
1. Create send transaction
2. Specify chain parameters
3. Set gas parameters
4. Sign and broadcast
-->

---
layout: top-title
color: emerald
---

:: title ::
# 📡 Broadcast Options
:: content ::

Different ways to send transactions:

```bash
# Direct broadcast (online required)
gnokey maketx ... | gnokey broadcast -

# Generate signed tx file (offline)
gnokey maketx ... > signed.tx

# Broadcast later
gnokey broadcast signed.tx
```

<div class="mt-4 bg-green-50 p-4 rounded-xl border-l-4 border-green-400 shadow-sm">
✅ <strong>Offline Signing</strong><br>
Sign transactions on air-gapped machines<br>
Broadcast from online terminals
</div>

---
layout: default
---

# 🔍 Querying the Blockchain

Common query commands:

```bash {1|2|3|4|5|6}
gnokey query vm/qrender gno.land/r/demo/boards
gnokey query auth/accounts/g1...
gnokey query bank/balances/g1...
gnokey query vm/qfile gno.land/p/demo/foo
gnokey query tm/block 7531
gnokey query vm/qeval gno.land/r/demo/calc
```

<div class="mt-4 text-sm op75">
🔍 Use <code>--data</code> flag for complex queries<br>
📖 See all options with <code>gnokey query --help</code>
</div>

---
layout: center
---

# ⚙️ Advanced Features

---
layout: top-title
color: purple
---

:: title ::
# 📝 Call Realm Functions
:: content ::

Execute functions in smart contracts:

```bash
gnokey maketx call \
  --pkg-path "gno.land/r/demo/mygrc20" \
  --func "Transfer" \
  --args "g1recipient" --args "1000" \
  --gas-fee 1ugnot \
  --gas-wanted 200000 \
  mykey | gnokey broadcast -
```

<!--
Arguments are passed in order
Complex types require JSON formatting
-->

---
layout: top-title
color: amber
---

:: title ::
# 🛡️ Multisig Transactions
:: content ::

Create transactions requiring multiple signatures:

```bash
# Create initial transaction
gnokey maketx send ... > tx.json

# First signature
gnokey sign --tx tx.json --signer key1 > tx-signed1.json

# Second signature
gnokey sign --tx tx-signed1.json --signer key2 > tx-final.json

# Broadcast
gnokey broadcast tx-final.json
```

---
layout: top-title
color: rose
---

:: title ::
# 💻 Development Tips
:: content ::

Workflow for testing:

```bash
# Local testnet
gno test

# Generate test coins
gnokey add testkey --insecure-password-stdin <<<"test123"

# Query testnet
gnokey query ... --remote 127.0.0.1:26657
```

<div class="mt-4 bg-rose-50 p-4 rounded-xl border-l-4 border-rose-400 shadow-sm">
⚠️ <strong>Never use insecure mode in production</strong><br>
Test keys have no real security
</div>

---
layout: center
---

# 🔗 Resources

- [📖 Full Gnokey Documentation](https://docs.gno.land/users/interact-with-gnokey)
- [💻 GitHub Repository](https://github.com/gnolang/gno)
- [💬 Gno Discord Community](https://discord.gg/gno)
- [🐦 Twitter @gnoland](https://twitter.com/gnoland)

```bash
# Always check for updates
go install github.com/gnolang/gno/gnokey@latest
```

<!--
Keep your CLI tools updated for new features
-->
```