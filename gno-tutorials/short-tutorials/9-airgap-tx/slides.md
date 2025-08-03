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


# 🛠️ Airgap transactions
## Secure your transaction with Gnokey

<!--
Gnokey is the primary CLI tool for interacting with Gno chains
Handles key management, transaction signing, and querying
-->

---

# Why using safer transaction? 

**Risks of Signing in an Online environment**:
- 🔑 Memory scraping attacks
- ⌨️ Keyloggers capturing passwords
- 🌐 MITM transaction hijacking
- 📧 Phishing fake transaction prompts


---
layout: top-title
color: purple
---

:: title ::
# 🔒 Airgap Transactions
:: content ::

## Secure Workflow

```mermaid
sequenceDiagram
    participant A as Machine A
    participant B as Machine B
    
    A->>B: Retreive user auth
    B->>B: Create local transaction
    B->>B: Sign of the transaction
    B->>A: Broadcast it
```


// Graph of the workflow

---

## 🛡️ Hardware Keys

### When Airgap Isn't Practical

```mermaid
graph TD
    U[User] -->|Initiate| O[Online Machine]
    O -->|Unsigned TX| H[Hardware Key]
    H -->|Secure Signing| S[Signed TX]
    S --> O
    O -->|Broadcast| N[Network]
```

<div class="grid grid-cols-2 gap-4 mt-6">
<div class="ns-bg-success ns-border-success">
✅ **Hardware Key Advantages**:
- 🔐 Private keys never leave secure element
- 🔒 Physical confirmation required
- 🛡️ Tamper-resistant design
- 🧪 Immune to computer malware
- 🔋 Portable security
</div>

<div class="ns-bg-info ns-border-info">
💡 **Recommended Hardware**:
- Ledger Nano series
- Trezor Model T
- YubiKey 5 Series
- Gnosis Safe hardware modules
- AirGap Vault (mobile-based)
</div>
</div>
