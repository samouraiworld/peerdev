---
title: Interact with Gnokey CLI
theme: ../../theme
colorSchema: teal
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---


# 🛠️ Secure transaction
## Airgap transaction and Hardware key

<!--
Gnokey is the primary CLI tool for interacting with Gno chains
It handles key management, transaction signing, and querying
Let's explore the secure way to interact with Gnoland by using Airgap tx and Hardware keys.
-->


---
layout: top-title
color: green
---

:: title ::
# 🔑 How to do a Transactions?
:: content ::

<div style="text-align: center">

```mermaid 
sequenceDiagram
    participant A as Machine
    participant B as Blockchain
    
    A->>A: Construct & Sign TX (locally)
    A->>B: Broadcast
```
</div>

---

# Why using safe transaction? 

**Risks of Signing in an Online environment**: Malware ⚠️
- 🔑 Memory scraping attacks
- ⌨️ Keyloggers capturing passwords
- 🌐 MITM transaction hijacking
- 📧 Phishing fake transaction prompts
- etc...

<!--
When signing in an online environment, you risk 

-->

---
layout: top-title
color: purple
---

:: title ::
# 🔒 Airgap Transactions
:: content ::

<div style="text-align: center">

```mermaid {scale: 0.9}
sequenceDiagram
    participant A as Online Machine
    participant B as Offline Machine
    participant C as Blockchain
    
    C-->>A: User Auth (Account id + nonce)
    Note right of A: Prevent replay attacks
    A->>B: User Auth
    B->>B: Construct & Sign TX (locally)
    B-->>A: Signed TX
    A->>C: Broadcast 
```
</div>

<!--
What is an airgap transaction?

-->

---
layout: top-title
color: blue
---

:: title ::
# 🛡️ Hardware Keys
:: content ::

<div style="text-align: center">

```mermaid {scale: 0.9}
sequenceDiagram  
    participant A as Online Machine
    participant B as Hardware Key
    participant C as Blockchain

    C-->>A: User Auth (Account id + nonce)
    A->>B: User Auth + Unsigned TX details
    Note right of A: Depends on the firmware
    B->>B: Construct & Sign TX (locally)
    B-->>A: Signed TX
    A->>C: Broadcast
```
</div>

<!--
What is an hardware key?


✅ **Hardware Key Advantages**:
- 🔐 Private keys never leave secure element
- 🔒 Physical confirmation required
- 🛡️ Tamper-resistant design
- 🧪 Immune to computer malware
- 🔋 Portable security
-->


---
layout: top-title
color: cyan
---

:: title ::
# 🛡️ Hardware key + Airgap Security
:: content ::

<div style="text-align: center">

```mermaid {scale: 0.9}
sequenceDiagram
    participant A as Online Machine
    participant B as Airgapped Hardware Key
    participant C as Blockchain
    
    C-->>A: User Auth (Account id + nonce)
    A->>B: Unsigned TX (via QR)
    Note right of B: Keys NEVER touch networked devices
    B->>B: Signs TX (verified on device screen)
    B-->>A: Signed TX (via QR)
    A->>C: Broadcast
```
</div>

---
layout: top-title
color: cyan
---

:: title ::
# 🛡️ Hardware key + Airgap Security
:: content ::


| **Advantages** ✅                          | **Limitations** ⚠️                     | 
|-----------------------------------------|-------------------------------------|
| **Isolation** (No USB/Bluetooth) |  **Slower** (Manual transfers)    |
| **Physical verification** (On-device display) | **Complex setup** (QR workflow) |
| **Immune to malware** (No driver exploits) | **Dependent on device security** (Firmware risks remain) |

⚠️ **Airgap ≠ Perfect Security**
- Always verify TX details **on the hardware key’s screen**.  

---
layout: top-title-two-cols
color: orange
---

:: title ::
# Hardware Key vs Airgap Environment

:: left ::
## 🛡️ Hardware Key
**Pros:**
<div class="ns-c-tight">

- **Instant signing process**
- **Tamper-proof hardware**
- Private keys never exposed
- Portable (works with any computer)
- Physical confirmation required
</div>

**Cons:**
<div class="ns-c-tight">

- **Hardware cost** 💰
- **Limited to supported blockchains**
- Firmware updates needed
</div>

:: right ::
## 🔒 Airgap Environment
**Pros:**
<div class="ns-c-tight">

- **Works with any offline device**
- **No special hardware needed**
- Flexible for any blockchain
- Complete network isolation
- Can store multiple key types
</div>

**Cons:**
<div class="ns-c-tight">

- **Multi-step process**
- Requires data transfer method
- Dependent on offline device security
- Manual setup complexity
</div>

---
layout: top-title
color: light
---

:: title ::
# What you should go for
:: content :: 

#### Hardware Key - Most Secure + Convenient 
##### Recommended way ✅
- Ledger **(Gno compatible)**, Trezor, YubiKey, ...

#### AirGap Vault - Secure but inconvenient 🔒
##### Must be offline ⚠️
- **Virtual Machine** - QEMU/KVM -- Or lighter with container
- **USB** - Tails OS (Amnesic system)
- **Hardware based** - Old smartphone, Old Laptop, dedicated Raspberry Pi
- **Mobile (IOS/Android)** - e.g.: AirGap 

#### Native Way - Convenient but vulnerable 👾
- Gnokey

<!--
QR code signing, offline OS mode 

I'm not affiliated to any of this company, they are just example.
https://www.ledger.com/
https://trezor.io/
https://www.yubico.com/

Tails OS on USB (amnesic system)
Old smartphone (permanently offline)
Dedicated Raspberry Pi (~$35)
-->


---
layout: top-title
color: purple
---

:: title ::
# ✍️ Multi-Signature Setup
:: content ::

<div style="text-align: center">

```mermaid {scale: 0.7}
sequenceDiagram
    participant A as Initiator
    participant B as Cosigner 1
    participant C as Cosigner 2
    participant D as Blockchain
    
    A->>B: Unsigned TX
    A->>C: Unsigned TX
    B->>B: Signs locally
    C->>C: Signs locally
    B-->>A: Partial signature
    C-->>A: Partial signature
    A->>A: Combines signatures
    A->>D: Broadcast final TX
```
</div>

<!--

Code part - What to demonstrate:

- How to do a simple transaction 
- How to do an airgap transaction (in local)
- In a VM (To simulate hardware)
- Hardware key https://github.com/gnolang/gno/issues/1119
- Multi-sign using the script
-->