---
title: Building Decentralized Forums with gno.land Boards
theme: ../theme
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🏗️ Building Decentralized Forums  
## Complete gno.land Boards Tutorial

Create Reddit-like communities on-chain  
Manage content with crypto payments

---
layout: top-title-two-cols
color: blue-light
---

:: title ::
# 🌐 What is gno.land Boards?
:: left ::

**Decentralized Bulletin Board System**  
Like Reddit/Forum but:
- 🔒 On blockchain
- 💰 Crypto-native
- 🧩 Fully programmable

:: right ::

**Core Features:**
- 🗂 Create topic boards
- 📝 Post threads & replies
- 💸 Tip with $GNOT
- 👥 Community moderation

---
layout: top-title
color: yellow-light
---

:: title ::
# 💡 Why blockchain forums?

:: content ::
- Censorship-resistant
- User-owned content
- Monetization built-in
- Transparent moderation

---

# 🧩 How It Works

<div class="grid grid-cols-2 gap-8 mt-4">
<div>

**Technical Foundation**
- ⛓️ Built on Gno blockchain
- 📜 Smart contracts (realms)
- 🔑 Managed with `gnokey` CLI

<br>

**Key Components:**
1. `boards.gno` - Core contract
2. `boards_test.gno` - Tests
3. Banker module - Handle payments

</div>
<div>

```go
// Sample contract structure
package boards

type Board struct {
    Name       string
    Moderators []Address
}

type Thread struct {
    ID      int
    Title   string
    Content string
    Author  Address
    Tips    int // in uGNOT
}
```

</div>
</div>

<!-- 
Boards are implemented as smart contracts ("realms")
Stored permanently on the Gno blockchain
Accessible globally through gno.land
-->

---

# 🧰 Setup Requirements

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="p-4 bg-teal-50 border-l-4 border-teal-400 rounded shadow">
<strong>🛠 Tools</strong>
```bash
# Install gnokey
git clone https://github.com/gnolang/gno
make install
```
</div>

<div class="p-4 bg-teal-50 border-l-4 border-teal-400 rounded shadow">
<strong>💰 Testnet Funds</strong>
```bash
# Get testnet GNOT
https://gno.land/faucet
```
</div>

<div class="p-4 bg-teal-50 border-l-4 border-teal-400 rounded shadow">
<strong>🔐 Account Setup</strong>
```bash
# Create test account
gnokey add myacc --recover
```
</div>

<div class="p-4 bg-teal-50 border-l-4 border-teal-400 rounded shadow">
<strong>🌐 Environment</strong>
```bash
# Testnet endpoint
https://testnet.gno.land
```
</div>

</div>

---

# 🗂 Board Management

<div class="grid grid-cols-2 gap-8">

<div class="p-4">
<strong>Create Board</strong>
```bash {all|1-3|4-5|all}
gnokey maketx call \
  --pkgpath "gno.land/r/demo/boards" \
  --func "CreateBoard" \
  --args "CryptoNews" \
  --gas-fee 1gnot
```
</div>

<div class="p-4">
<strong>Add Moderator</strong>
```bash
gnokey maketx call \
  --func "AddModerator" \
  --args "CryptoNews" "g1xyz..." 
```
</div>

</div>

<div class="mt-6 p-4 bg-amber-50 border-l-4 border-amber-400 rounded shadow">
💡 Only board creator can add moderators  <br>
💡 Board names are case-sensitive
</div>

---

# 📝 Content Creation

<div class="grid grid-cols-2 gap-8">

<div class="p-4">
<strong>Create Thread</strong>
```bash {all|1-3|4-5|all}
gnokey maketx call \
  --func "CreateThread" \
  --args "CryptoNews" "Market Update" \
        "BTC surged 10% today..." \
  --gas-fee 1gnot
```
</div>

<div class="p-4">
<strong>Reply with Tip</strong>
```bash
gnokey maketx call \
  --func "CreateReply" \
  --args "CryptoNews" "1" "Great analysis!" \
  --send "500gnot"
```
</div>

</div>

<div class="mt-6 p-4 bg-green-50 border-l-4 border-green-400 rounded shadow">
✅ 1 GNOT fee prevents spam   <br>
   Tips go directly to author
</div>

---

# 🛠 Content Management

<div class="grid grid-cols-2 gap-8">

<div class="p-4">
<strong>Edit Thread</strong>
```bash {all|1-3|4-5|all}
gnokey maketx call \
  --func "EditThread" \
  --args "CryptoNews" "1" \
        "Updated Market Analysis" \
        "Revised data..."
```
</div>

<div class="p-4">
<strong>Delete Reply</strong>
```bash
gnokey maketx call \
  --func "DeleteReply" \
  --args "CryptoNews" "1" "3"
```
</div>

</div>

<div class="mt-6 p-4 bg-red-50 border-l-4 border-red-400 rounded shadow">
⚠️ Only original authors can edit   <br>
   Moderators can delete any content
</div>

---

# 🔍 Querying Data

<div class="grid grid-cols-2 gap-8">

<div class="p-4">
<strong>List Boards</strong>
```bash
gnokey query "vm/qeval" \
  --data "gno.land/r/demo/boards"
```
</div>

<div class="p-4">
<strong>View Thread</strong>
```bash
gnokey query "vm/qrender" \
  --data "gno.land/r/demo/boards/CryptoNews/1"
```
</div>

<div class="p-4">
<strong>User Activity</strong>
```bash
gnokey query "vm/qeval" \
  --data 'GetUserPosts("g1myaddress...")'
```
</div>

<div class="p-4">
<strong>Transaction History</strong>
```bash
gnokey query txs --tags boards
```
</div>

</div>

---

# ⚙️ Advanced Customization

<div class="grid grid-cols-2 gap-8">

<div class="p-4">
<strong>Change Board Policy</strong>
```bash {all|1-3|4-5|all}
gnokey maketx call \
  --func "SetBoardPolicy" \
  --args "CryptoNews" \
  '{"MinThreadFee":"2gnot"}'
```
</div>

<div class="p-4">
<strong>Karma System</strong>
```go
// In boards.gno
func CreateReply(..., reward int) {
  userKarma[author] += reward
}
```
</div>

</div>

<div class="mt-6 p-4 bg-purple-50 border-l-4 border-purple-400 rounded shadow">
💡 Implement custom logic in realm   <br>
   Modify contract for unique features
</div>

---

# 🚨 Troubleshooting Guide

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="p-4 bg-red-50 border-l-4 border-red-400 rounded shadow">
<strong>❌ "insufficient fee"</strong>
```bash
# Solution:
--gas-fee 5gnot --gas-wanted 2000000
```
</div>

<div class="p-4 bg-red-50 border-l-4 border-red-400 rounded shadow">
<strong>❌ "invalid board"</strong>
```bash
# Solution:
gnokey query boards
# Verify exact name
```
</div>

<div class="p-4 bg-red-50 border-l-4 border-red-400 rounded shadow">
<strong>❌ "permission denied"</strong>
```bash
# Solution:
1. Check moderator status
2. Verify post ownership
```
</div>

<div class="p-4 bg-red-50 border-l-4 border-red-400 rounded shadow">
<strong>❌ "render failed"</strong>
```bash
# Solution:
Verify thread exists:
gno.land/r/demo/boards/BoardName/ID
```
</div>

</div>

---

# 🚀 Next Level Enhancements

<div class="grid grid-cols-3 gap-4 mt-6 text-center">

<div class="p-4 bg-blue-50 rounded-lg">
<div class="text-4xl mb-2">🖼️</div>
<strong>NFT Avatars</strong>
User profile pictures
</div>

<div class="p-4 bg-green-50 rounded-lg">
<div class="text-4xl mb-2">🗳️</div>
<strong>Voting</strong>
Upvote/downvote system
</div>

<div class="p-4 bg-purple-50 rounded-lg">
<div class="text-4xl mb-2">🔒</div>
<strong>Staking</strong>
Premium board access
</div>

<div class="p-4 bg-amber-50 rounded-lg">
<div class="text-4xl mb-2">🌐</div>
<strong>Web UI</strong>
React frontend
</div>

<div class="p-4 bg-teal-50 rounded-lg">
<div class="text-4xl mb-2">🤖</div>
<strong>Bots</strong>
Automated moderation
</div>

<div class="p-4 bg-pink-50 rounded-lg">
<div class="text-4xl mb-2">🔔</div>
<strong>Notifications</strong>
Activity alerts
</div>

</div>

---

# ✅ Verification Checklist

1. [ ] Board created and visible
2. [ ] Thread posted with fee deduction
3. [ ] Reply with successful tip transfer
4. [ ] Edit/delete operations working
5. [ ] Custom policies applied
6. [ ] All queries returning valid data

<br>

<div class="mt-6 p-4 bg-teal-50 border-l-4 border-teal-400 rounded shadow">
💻 <strong>Live Demo:</strong> gno.land/r/demo/boards<br>
📚 <strong>Source Code:</strong> github.com/gnolang/gno/tree/master/examples/gno.land/r/demo/boards
</div>

---

# 🌐 Resources & Next Steps

<div class="grid grid-cols-2 gap-8 mt-6">

<div>
<strong>Essential Links</strong>
- [📚 Boards Contract](https://github.com/gnolang/gno/blob/master/examples/gno.land/r/demo/boards/boards.gno)
- [⚙️ gno.land API](https://github.com/gnolang/gno/tree/master/cmd/gnoland/docs/api)
- [💬 Discord Community](https://discord.gg/gnoland)
</div>

<div>
<strong>Continue Learning</strong>
1. Add user profiles
2. Implement spam filters
3. Create board categories
4. Build notification system
</div>

</div>

<div class="mt-8 text-center text-xl">
🎉 <strong>You've built a decentralized Reddit!</strong>
</div>