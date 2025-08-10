---
title: Gno.Land Series — Episode 1  
theme: neversink
cover: https://gno.land/public/imgs/gnoland.svg  
colorSchema: teal  
highlight: dracula  
highlighter: shiki  
fonts:
  sans: Inter  
  mono: Fira Code  
layout: cover  
aspectRatio: 16/9
---

# 🎬 <span class="text-teal-500">Initializing Gno</span>

* ✅ Installing Gno
* ⚙️ Setting up a local environment

<div class="text-sm op75 mt-2">📎 Helpful links available in the episode description</div>

<!--
Hello everyone, welcome to the Gnoland tutorial series.
We will cover up every aspect of Gno in short efficient video.
They are meant to treat a subject independantly using visual and working example. They should be watched along the documentation and your own exercises.

As for myself, my name is David and I'm a Devrel in Samourai Coop. My job is basically to help you in your journey, so for any questions I'm available in the official Gnoland server.
If you feel I didn't cover an important subject, you can tag me on discord and I will do my best to recommend, or make a video to suit your needs!

As of today, we will cover the installation of Gno and go through your first Gno project.
-->
---

# ✅ <span class="text-blue-500">Prerequisites</span>

<div class="grid  gap-6 mt-6">

<div class="bg-blue-50 p-6 rounded-xl border-l-4 border-blue-400 shadow-sm">
🧠 Basic programming knowledge in Go
</div>

<div class="bg-indigo-50 p-6 rounded-xl border-l-4 border-indigo-400 shadow-sm">
🌐 Understanding of Blockchain / Web3 fundamentals  
</div>

</div>

<!--
Gno is based on the syntax of Go, which is known to be easy to learn with a simple syntax.

To go through Gnoland, you will need basic programming knowledge of Go.
Good understanding of Blockchain / web3 concept.
- Blockchain 
- Wallet
...
-->
---

# 🌐 What is <span class="text-green-500">Gno.Land?</span>

* 🔗 A **Layer 1** Blockchain
* 📝 Uses **Gno language** — a smart contract oriented version of Go
* 🧠 Focus on readable, open-source smart contracts

<br/>

### 🧱 Core Components

* **Realms** → Smart contracts
* **Pure Packages** → Reusable libraries

<div class="mt-6 p-4 bg-green-50 border-l-4 border-green-400 rounded shadow">
💰 Native Token: <strong>GnoT</strong>
</div>

<!--
Gnoland is a layer 1 blockchain. 
Not relying underlying chain as it is done in layer 2 
It has its own node and validators to confirm transaction

Uses gno language

To compare it with solidity
Natively, Every code you deploy will have its visual interface, and available source code since it is interpreted.
Which enforce a more readable environment, ...
-->
---

# ⚙️ <span class="text-purple-500">Go Environment Setup</span>

If Go isn’t already set up, add the following to your shell config:

```bash
# For bash, zsh, etc.
export PATH=$PATH:$HOME/go/bin
```

```fish
# For fish shell users
set -gx PATH $PATH $HOME/go/bin
```

<div class="mt-4 p-4 bg-purple-50 border-l-4 border-purple-400 rounded shadow">
💡 Restart your shell for the changes to take effect.
</div>

---

# ⏭️ <span class="text-amber-500">Coming Up in Episode 2</span>

<div class="grid grid-cols-2 gap-6 mt-6 text-sm">

<div class="bg-amber-50 p-4 rounded-xl border-l-4 border-amber-400 shadow-sm">
✨ Build a basic Realm (smart contract)  
🚀 Deploy locally using <code>gnodev</code>  
</div>

<div class="bg-yellow-50 p-4 rounded-xl border-l-4 border-yellow-400 shadow-sm">
📦 Understand the <code>gnomod.toml</code> system  
🌐 Interact with Gnoweb  
🧪 Write and run smart contract tests  
</div>

</div>

<br/>

<div class="text-center mt-4 text-sm op75">
📌 <strong>Example Project</strong>: Mini social application
</div>

<!--
Next steps:
- Show environment variable + addition in fish/bash
- Present:
  - gnomod.toml
  - 0_counter.gno
- Gnokey
- Gnoweb
- First transaction
-->
