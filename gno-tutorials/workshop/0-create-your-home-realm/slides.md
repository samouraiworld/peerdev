---
title: Create Your First dApp on Gno.land
theme: ../../theme
colorSchema: teal
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🏠 Create Your First dApp on Gno.land
## Build Your Home Realm

<!--
Welcome to this workshop where you'll learn to build your first Home Realm on Gno.land.
We'll cover everything from setup to deployment and testing.
-->

---
layout: top-title
color: sky
---

:: title ::
# 🎯 Workshop Objectives
:: content ::

<div class="grid gap-6 mt-4">

<div class="bg-blue-50 p-6 rounded-xl border-l-4 border-blue-400 shadow-sm">
🏠 <strong>Create Your Home Realm</strong><br>
Build a personalized, on-chain space that reflects your creativity
</div>

<div class="bg-green-50 p-6 rounded-xl border-l-4 border-green-400 shadow-sm">
🚀 <strong>Deploy a Simple dApp</strong><br>
Learn the fundamentals of Gno.land application deployment
</div>

<div class="bg-purple-50 p-6 rounded-xl border-l-4 border-purple-400 shadow-sm">
🧪 <strong>Test & Interact</strong><br>
Master testing and interaction patterns for your realm
</div>

<div class="bg-orange-50 p-6 rounded-xl border-l-4 border-orange-400 shadow-sm">
📢 <strong>Publish & Share</strong><br>
Register your realm in the Hall of Realms for the community
</div>

</div>

<!--
By the end of this workshop, you'll have a functioning realm deployed and the knowledge to continue building on Gno.land
-->

---
layout: center
---

# 🌟 What is Gno.land?

<!--
Before we dive into building, let's understand what Gno.land is
-->

---
layout: default
---

# 🌟 What is Gno.land?

<div class="grid gap-6 mt-4">

<div class="bg-teal-50 p-6 rounded-xl border-l-4 border-teal-400 shadow-sm">
🧬 <strong>Gno Language</strong><br>
Go-like smart contract language with enhanced capabilities
</div>

<div class="bg-blue-50 p-6 rounded-xl border-l-4 border-blue-400 shadow-sm">
🔗 <strong>Blockchain Platform</strong><br>
Built for scalable, composable decentralized applications
</div>

<div class="bg-green-50 p-6 rounded-xl border-l-4 border-green-400 shadow-sm">
🎭 <strong>Realms & Packages</strong><br>
Smart contracts that can call each other and share functionality
</div>

</div>

<div class="op75 text-teal-600 mt-6">

🔗 Read more: [What is Gno?](https://docs.gno.land/builders/what-is-gnolang)
</div>

<!--
Gno.land is a blockchain platform that uses the Gno language - similar to Go but designed for smart contracts
-->

---
layout: center
---

# 🏠 What is a Home Realm?

<!--
Now let's understand what we're going to build - a Home Realm
-->

---
layout: default
---

# 🏠 What is a Home Realm?

Your **personal decentralized space** on Gno.land that reflects your creativity and personality.

<div class="grid gap-6 mt-6">

<div class="bg-pink-50 p-6 rounded-xl border-l-4 border-pink-400 shadow-sm">
🎨 <strong>Personalized</strong><br>
Express your unique identity and interests
</div>

<div class="bg-cyan-50 p-6 rounded-xl border-l-4 border-cyan-400 shadow-sm">
🔗 <strong>On-Chain</strong><br>
Fully deployed and living on the blockchain
</div>

<div class="bg-yellow-50 p-6 rounded-xl border-l-4 border-yellow-400 shadow-sm">
🎮 <strong>Interactive</strong><br>
Can include games, votes, messages, and custom logic
</div>

<div class="bg-emerald-50 p-6 rounded-xl border-l-4 border-emerald-400 shadow-sm">
🌍 <strong>Community</strong><br>
Discoverable in the Hall of Realms
</div>

</div>

<!--
Think of it as your personal website, but completely decentralized and programmable
-->

---
layout: center
---

# 📋 Prerequisites & Setup

<!--
Let's make sure your environment is ready for development
-->

---
layout: default
---

# 📋 Prerequisites & Setup

## 🛠 Required Tools

- **Gno.land development environment**
- **Keypair creation** for identity
- **Faucet access** for testnet tokens
- **gnodev** for local development

## 📺 Essential Videos

<div class="mt-4 space-y-2">

- [Setup local environment](https://www.youtube.com/watch?v=C8RuA_uU3Fs)
- [IDE capabilities with Gnopls](https://www.youtube.com/watch?v=-byuFoVYp30)  
- [Build and test your first dApp](https://www.youtube.com/watch?v=nzo6QgxQHgw&t=161s)

</div>

<div class="mt-6 p-4 bg-blue-50 border-l-4 border-blue-400 rounded shadow">
💡 <strong>Tip:</strong> Watch these videos before the workshop for the best experience!
</div>

<!--
Make sure you have these tools set up before we start coding
-->

---
layout: center
---

# 💻 Live Coding: Build Your First Realm

<!--
Now for the fun part - let's build!
-->

---
layout: default
---

# 💻 Building Your Realm - Architecture

## 📁 Project Structure

```
my-home-realm/
├── realm.gno          # Main realm logic
├── realm_test.gno     # Tests
└── gno.mod           # Module definition
```

## 🔧 Core Components

- **Package declaration** and imports
- **State management** for your realm data
- **Functions** for interactions
- **Current realm** identity handling

<!--
We'll start with a simple structure and build up from there
-->

---
layout: default
---

# 💻 Basic Realm Code Structure

```go {all|1-5|7-9|11-15|17-21}
package home

import (
    "std"
)

var (
    owner std.Address
)

func init() {
    owner = std.CurrentRealm().Address()
}

func Render(path string) string {
    return "# Welcome to My Home Realm!\n\n" +
           "Owner: " + owner.String()
}

func GetOwner() std.Address {
    return owner
}
```

<!--
This is the basic structure of a realm. Let's break it down:
- Package declaration
- State variables
- Initialization
- Render function for display
- Getter functions
-->

---
layout: default
---

# 🔐 Using Adena & Gnokey

## 🦊 Adena Wallet
- Browser extension for Gno.land
- Sign transactions easily
- Manage your keypairs

## 🔑 Gnokey CLI
```bash
# Create a new key
gnokey add mykey

# Send a transaction
gnokey maketx call -pkgpath "gno.land/r/user/home" \
  -func "UpdateMessage" -args "Hello World!" mykey
```

<!--
These are the main tools for interacting with your deployed realm
-->

---
layout: center
---

# 🧪 Testing Your Realm

<!--
Testing is crucial for reliable dApps
-->

---
layout: default
---

# 🧪 Testing Your Realm

## 📝 Writing Tests

```go {all|1-7|9-15|17-22}
package home

import (
    "testing"
    "std"
)

func TestInit(t *testing.T) {
    owner := GetOwner()
    if owner == "" {
        t.Error("Owner should be set")
    }
}

func TestRender(t *testing.T) {
    result := Render("")
    if result == "" {
        t.Error("Render should return content")
    }
}
```

<div class="op75 text-teal-600 mt-4">

🔗 Read more: [Running & testing Gno code](https://docs.gno.land/resources/gno-testing)
</div>

<!--
Always test your realm before deployment to catch issues early
-->

---
layout: center
---

# 🎮 Going Further: Games & Fun

<!--
Let's explore what else you can build with your realm
-->

---
layout: default
---

# 🎮 Advanced Features & Packages

## 🎨 Visual Elements

<div class="grid gap-4 mt-4">

<div class="bg-purple-50 p-4 rounded-lg">
<strong>SVG Generation</strong><br>
<code>gno.land/p/demo/svg</code>
</div>

<div class="bg-blue-50 p-4 rounded-lg">
<strong>Interactive Buttons</strong><br>
<code>gno.land/p/leon/svgbtn</code>
</div>

<div class="bg-green-50 p-4 rounded-lg">
<strong>ASCII Art</strong><br>
<code>gno.land/p/lou/ascii</code>
</div>

</div>

## 🎮 Game Ideas

- Voting systems
- Simple games (tic-tac-toe, guessing games)
- Message boards
- Counters and statistics

<!--
These packages provide building blocks for rich, interactive experiences
-->

---
layout: center
---

# 🏛 Hall of Realms

<!--
Time to share your creation with the world
-->

---
layout: default
---

# 🏛 Deploying to Hall of Realms

## 🚀 Deployment Process

```bash {all|1-3|5-7|9-11}
# Deploy your realm
gnokey maketx addpkg -pkgdir ./my-home-realm \
  -pkgpath "gno.land/r/yourusername/home" mykey

# Test the deployment
gnokey query "vm/qeval" -data \
  "gno.land/r/yourusername/home.Render(\"\")"

# Register in Hall of Realms
# Visit the Hall of Realms dApp
# Submit your realm for community discovery
```

<div class="op75 text-teal-600 mt-4">

🔗 Read more: [Deploying Gno Packages](https://docs.gno.land/builders/deploy-packages)
</div>

<!--
Once deployed, your realm becomes part of the Gno.land ecosystem
-->

---
layout: center
---

# 🎉 Congratulations!

<!--
You've built your first realm!
-->

---
layout: default
---

# 🎉 What You've Accomplished

<div class="grid gap-6 mt-4">

<div class="bg-green-50 p-6 rounded-xl border-l-4 border-green-400 shadow-sm">
✅ <strong>Built Your First Realm</strong><br>
Created a personalized dApp on Gno.land
</div>

<div class="bg-blue-50 p-6 rounded-xl border-l-4 border-blue-400 shadow-sm">
✅ <strong>Learned Core Concepts</strong><br>
Understanding of realms, packages, and testing
</div>

<div class="bg-purple-50 p-6 rounded-xl border-l-4 border-purple-400 shadow-sm">
✅ <strong>Deployed & Tested</strong><br>
Hands-on experience with the full development cycle
</div>

<div class="bg-orange-50 p-6 rounded-xl border-l-4 border-orange-400 shadow-sm">
✅ <strong>Joined the Community</strong><br>
Your realm is now discoverable in the Hall of Realms
</div>

</div>

<!--
You're now ready to continue building and experimenting on Gno.land
-->

---
layout: default
---

# 🚀 Next Steps & Best Practices

## 🛠 Keep Building

- Experiment with different packages
- Add game mechanics to your realm
- Create interactive features

## 📚 Stay Updated

- Follow Gno Digest for new packages
- Join the community discussions
- Share your creations

## 🌟 Best Practices

- Always test before deploying
- Keep your code simple and readable
- Document your realm's features

<div class="mt-6 p-4 bg-teal-50 border-l-4 border-teal-400 rounded shadow">
🌟 <strong>Don't forget to share your realm with the community and inspire the next generation of builders!</strong>
</div>

<!--
The journey doesn't end here - keep exploring and building amazing things on Gno.land
-->

---
layout: center
---

# 📚 Resources & Documentation

---
layout: default
---

# 📚 Essential Resources

## 🔗 Core Documentation

- [What is Gno?](https://docs.gno.land/builders/what-is-gnolang)
- [Gno Packages](https://docs.gno.land/resources/gno-packages)
- [Standard Libraries](https://docs.gno.land/resources/gno-stdlibs)
- [Testing Guide](https://docs.gno.land/resources/gno-testing)

## 🎨 Creative Packages

- [SVG Generation Library](https://gno.land/p/demo/svg)
- [SVG Buttons](https://gno.land/p/leon/svgbtn)
- [ASCII UI Elements](https://gno.land/p/lou/ascii)
- [Art Examples](https://gno.land/r/demo/art)

## 🚀 Deployment

- [Deploying Gno Packages](https://docs.gno.land/builders/deploy-packages)

<!--
These resources will help you continue your Gno.land journey
-->

---
layout: center
---

# Thank You! 🙏

## Start building your own realm today!

<div class="op75 text-teal-600">

🌐 [gno.land](https://gno.land) | 🏛 [Hall of Realms](https://gno.land/r/demo/groups)
</div>

<!--
Thank you for joining this workshop. We can't wait to see what amazing realms you'll create!
-->
