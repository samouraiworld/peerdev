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

# 🎬 Episode 1: <span class="text-teal-500">Initializing Gno</span>

* ✅ Installing Gno
* ⚙️ Setting up a local environment

<div class="text-sm op75 mt-2">📎 Helpful links available in the episode description</div>

---

# ✅ <span class="text-blue-500">Prerequisites</span>

<div class="grid  gap-6 mt-6">

<div class="bg-blue-50 p-6 rounded-xl border-l-4 border-blue-400 shadow-sm">
🧠 Basic programming knowledge  
</div>

<div class="bg-indigo-50 p-6 rounded-xl border-l-4 border-indigo-400 shadow-sm">
🌐 Understanding of Blockchain / Web3 fundamentals  
</div>

</div>

---

# 🌐 What is <span class="text-green-500">Gno.Land?</span>

* 🔗 A **Layer 1** Blockchain
* 📝 Uses **Gno language** — an interpreted version of Go
* 🧠 Focus on readable, open-source smart contracts

<br/>

### 🧱 Core Components

* **Realms** → Smart contracts
* **Packages** → Reusable libraries

<div class="mt-6 p-4 bg-green-50 border-l-4 border-green-400 rounded shadow">
💰 Native Token: <strong>GnoT</strong>
</div>

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
📦 Understand the <code>gno.mod</code> system  
🌐 Interact with Gnoweb  
🧪 Write and run smart contract tests  
</div>

</div>

<br/>

<div class="text-center mt-4 text-sm op75">
📌 <strong>Example Project</strong>: Mini social application
</div>
