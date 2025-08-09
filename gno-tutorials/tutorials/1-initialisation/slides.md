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
They are meant to treat a subject independantly using visual and running example. They should be watched along the documentation and your own exercises.

As for myself, my name is David and I'm a Devrel in Samourai Coop. My job is basically to help you in your journey, so for any questions I'm available in the official Gnoland server.
If you feel I miss an important subject, you can tag me on discord and I will recommand an existing video, and if not make a video.

As of today, we will cover the installation of Gno and go through your first project.
-->
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

<!--
To be able to go through Gnoland, you will need basic programming knowledge in Go. 
It is a programming language made by Google, known to be easy to learn with a simple synthax.
-->
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
📦 Understand the <code>gnomod.toml</code> system  
🌐 Interact with Gnoweb  
🧪 Write and run smart contract tests  
</div>

</div>

<br/>

<div class="text-center mt-4 text-sm op75">
📌 <strong>Example Project</strong>: Mini social application
</div>
