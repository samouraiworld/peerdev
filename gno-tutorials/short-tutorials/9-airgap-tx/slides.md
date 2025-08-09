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


# 🛠️ Secure transaction
## Airgap tx and Hardware key

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

<!--
When signing in an online environment, you risk 

-->

---
layout: top-title
color: green
---

:: title ::
# 🔑 How to do a Transactions?
:: content ::

```mermaid 
sequenceDiagram
    participant A as Machine
    participant B as Blockchain
    
    A->>A: Construct & Sign TX (locally)
    A->>B: Broadcast
```


---
layout: top-title
color: purple
---

:: title ::
# 🔒 Airgap Transactions
:: content ::


```mermaid {scale: 0.8}
sequenceDiagram
    participant A as Online Machine
    participant B as Offline Machine
    participant C as Blockchain
    
    C-->>A: User Auth (Account nb + nonce)
    Note right of A: Prevent replay attacks
    A->>B: User Auth
    B->>B: Construct & Sign TX (locally)
    B-->>A: Signed TX
    A->>C: Broadcast 
```

---
layout: top-title
color: blue
---

:: title ::
## 🛡️ Hardware Keys
:: content ::

```mermaid
sequenceDiagram 
    participant A as Online Machine
    participant B as Hardware Key
    participant C as Blockchain

    A->>B: Unsigned TX details
    Note right of A: Depends on the firmware
    B->>B: Construct & Sign TX (locally)
    B-->>A: Signed TX
    A->>C: Broadcast
```

---
layout: top-title
color: blue
---

:: title ::
## 🛡️ Hardware Keys
:: content ::

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

---

# Hardware key VS airgap transaction

