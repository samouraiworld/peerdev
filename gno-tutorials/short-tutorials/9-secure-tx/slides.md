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
# 🛡️ Hardware Key 
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
# 🛡️ Hardware Key + Airgap Security
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
# 🛡️ Hardware Key + Airgap Security
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
color: green
---

:: title ::
# What you should go for (keys)
:: content :: 
<div class="ns-c-tight">

#### Hardware Key - Most Secure + Convenient 
##### Recommended way ✅
- Ledger **(Gno compatible)**, Trezor, YubiKey, ...

#### AirGap Vault - Secure but inconvenient 🔒
##### Must be offline ⚠️
- **Hardware based** - Old smartphone, Old Laptop, dedicated Raspberry Pi
- **USB** - Tails OS (Amnesic system)
- **Mobile (IOS/Android)** - **Adena Mobile** (Gno compatible), Metamask, AirGap 
    - **Bonus**: Use dedicated profile with secured alternative OS (GrapheneOS)
- **Qubes OS** - QEMU/KVM

#### Encrypted Keys - Good first step 
- **Local password manager** - KeepassXC

#### Native Way - Convenient but vulnerable 👾
- Gnokey
</div>

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
color: green-light
---

:: title ::
# 🛡️ Security Best Practices (mnemonics)
:: content ::

<div class="ns-c-tight">

#### 🔑 Key Management
- **Never store mnemonics in clear on networked machines** ⚠️
- Encrypt it using password manager -- Preferably locally (KeepassXC)
- Use dedicated offline device for keys (hardware key, USB key, Old smartphone)

#### 🌐 Transaction Safety
- **Always verify TX details before signing**
- **Double-check recipient addresses**
- Use testnet for experiments 

#### 🛟 Recovery
- Test recovery process periodically ⏲️
- Store mnemonics/second hardware key in fireproof safe (At home, bank)

</div>

---
layout: top-title
color: purple
---

:: title ::
# ✍️ Multi-Signature Setup
:: content ::

```mermaid{scale: 0.5}
sequenceDiagram
    participant A as Alice
    participant KB as Keybase
    participant BC as Blockchain
    participant B as Bob
    participant C as Charlie

        note over A: Keybase Initialization
        A->>KB: Create Alice keybase (alice-kb)
        A->>KB: Add Bob's pubkey (multisig-bob)
        A->>KB: Add Charlie's pubkey (multisig-charlie)
        A->>KB: Create multisig-abc (2/3 threshold)
        
        B->>KB: Create Bob keybase (bob-kb)
        B->>KB: Add Alice's pubkey (multisig-alice)
        B->>KB: Add Charlie's pubkey (multisig-charlie)
        B->>KB: Create multisig-abc
        
        C->>KB: Create Charlie keybase (charlie-kb)
        C->>KB: Add Alice's pubkey (multisig-alice)
        C->>KB: Add Bob's pubkey (multisig-bob)
        C->>KB: Create multisig-abc
```

<!--
### 1. Create Multisig Account
### 2. Fund the Account
### 3. Verify Setup
-->

---
layout: top-title
color: purple
---

:: title ::
# ✍️ Multi-Signature Execution
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


---
layout: top-title
color: purple
---

:: title ::
# 🔐 Shamir Secret Sharing (SSS)

:: content ::

<div style="text-align: center">

```mermaid
graph TD
    S[Original Secret] -->|Split| S1(Share 1)
    S -->|Split| S2(Share 2)
    S -->|Split| S3(Share 3)
    S -->|Split| S4(Share 4)
    S -->|Split| S5(Share 5)
    
    S1 -->|2 of 5| R[Reconstruct Secret]
    S3 -->|2 of 5| R
    S5 -->|2 of 5| R
```

</div>

### Core Concept
- **Split** secrets into `N` shares
- **Reconstruct** with any `M` shares (`M ≤ N`)
- **Single shares** reveal *zero* information about original secret

---

## 📐 Mathematical Foundation
### Polynomial Secret Encoding
```math
f(x) = a_0 + a_1x + a_2x^2 + ... + a_{k-1}x^{k-1}
```
Where:
- $a_0$ = **Secret**
- $a_1..a_{k-1}$ = Random coefficients
- Shares = Points $(x, f(x))$

---

## 🛡️ Security Advantages

| Feature                | Benefit                                                                 |
|------------------------|-------------------------------------------------------------------------|
| **Threshold Security** | Compromise of < M shares reveals nothing                                |
| **Dynamic Allocation** | Add/revoke shares without changing secret                              |
| **Progressive Trust**  | Distribute shares across entities/locations                             |
| **Verifiable Shares**  | Cryptographic proofs of share validity                                  |

---

## 🧩 Practical Implementation

### Creating Shares (3-of-5)
```bash
# Using ssss utility
echo "MyCryptoSecret" | ssss-split -t 3 -n 5
Generating shares using a (3,5) scheme...
Share 1: 1-8feb3d4c9a
Share 2: 2-71c9205bf3
Share 3: 3-02a9d67e81
Share 4: 4-d5b1c8f23e
Share 5: 5-6e9a0b47cd
```

### Recovering Secret
```bash
ssss-combine -t 3
Enter 3 shares:
Share 1: 3-02a9d67e81
Share 2: 5-6e9a0b47cd
Share 3: 1-8feb3d4c9a
Result: MyCryptoSecret
```

---

## 🔐 Blockchain Applications

1. **Multisig Wallet Recovery**
   - Split seed phrase into 5 shares (3 needed to recover)
   
2. **Validator Key Safeguarding**
   - Distribute consensus keys across team members
   
3. **Enterprise Secret Management**
   - Board members hold key shares for treasury access

```mermaid
pie
    title Share Distribution
    “Safe Deposit Box” : 1
    “Lawyer” : 1
    “Spouse” : 1
    “Bank” : 1
    “Trusted Friend” : 1
```

---
```mermaid
graph TB
    LB[Load Balancer] --> HSM1[HSM 1]
    LB --> HSM2[HSM 2]
    LB --> HSM3[HSM 3]
    
    HSM1 -->|Sync| HSMC[HSM Cluster]
    HSM2 -->|Sync| HSMC
    HSM3 -->|Sync| HSMC
    
    HSMC --> DB[Audit Database]
    
    style HSMC fill:#1565c0,stroke:#0d47a1
```

```mermaid
graph LR
    H[HSM] -->|Secure Proof Generation| Z[zk-Rollup]
    H -->|MPC Integration| M[Multisig]
```

---

## ⚠️ Critical Considerations

1. **Secure Generation Environment**
   - Perform splitting on airgapped device

2. **Share Verification**
   ```python
   from ssss import verify_share
   assert verify_share(share, public_params)
   ```

3. **Physical Security**
   - Use tamper-evident storage for shares

4. **Redundancy**
   - Store multiple copies of critical shares

---

## 🚀 Advanced: Proactive SSSS

**Rotate shares periodically without changing secret:**
```mermaid
sequenceDiagram
    participant H as Holder 1
    participant C as Coordinator
    participant H2 as Holder 2
    participant H3 as Holder 3
    
    H->>C: Current Share
    H2->>C: Current Share
    H3->>C: Current Share
    C->>H: New Share (encrypted)
    C->>H2: New Share (encrypted)
    C->>H3: New Share (encrypted)
```

*Mitigates long-term share compromise through periodic refresh*

---

# 🔑 When to Use SSSS

| Scenario                  | Recommendation     |
|---------------------------|--------------------|
| Personal Key Backup       | ✅ 3-of-5          |
| Enterprise Treasury       | ✅ 5-of-9          |
| Validator Key Management  | ✅ 7-of-12         |
| Single Device Storage     | ❌ (Use HSMs)      |


<!--

Code part - What to demonstrate:

- How to do a simple transaction 
- How to do an airgap transaction (in local)
- In a Virtual VM (To simulate hardware)
- Hardware key https://github.com/gnolang/gno/issues/1119
- Using Adena Wallet https://www.adena.app/
- Multi-sign using the script
-->

---
layout: top-title
color: amber
---

:: title ::
# 🚀 Next Steps
:: content ::

### Practical Exercises:
1. Setup airgap environment with QEMU
2. Create 2/3 multisig wallet
3. Perform secure contract deployment

### Advanced Topics:
- Hardware wallet integration (Ledger)
- Transaction monitoring tools -- Using `tx-indexer`
- Secure key rotation procedures

<div class="mt-8 text-center">
<a href="https://github.com/gnolang/gno" target="_blank" class="!no-underline">
  <button class="bg-amber-500 hover:bg-amber-600 text-white py-3 px-6 rounded-lg">
    Explore Gno Documentation
  </button>
</a>
</div>