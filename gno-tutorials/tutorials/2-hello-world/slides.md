---
theme: neversink
paginate: true
title: Hello Gno World !
background: https://marp.app/assets/hero-background.svg
mdc: true
---

# 🎓 2 - <span class="text-teal-500">Hello Gno World 🌍</span>

What’s Gno language?  
Build and test your first dApp

<div class="text-sm op75 mt-2">🎯 Learn Gno basics • Build a mini dApp • Practice testing and good design</div>

---

# 🤔 <span class="text-blue-500">Gno vs Go</span>

- Familiar **syntax** and **standard library**

### 🔍 Key differences:

- ✅ **Deterministic execution**  
- ✅ Built-in **smart contract support**  
- 🚫 **No external network access**  
- 🚫 **No goroutines** (yet!)

---

## 📢 <span class="text-purple-500">Let's Build a Public Blog Platform</span>

### ✨ Features:
- A **public post feed** (anyone can post)

<br/>

```go
type Post struct {
    Title     string
    Content   string
    Author    std.Address
    CreatedAt time.Time
}
```

---

# 🧪 <span class="text-emerald-500">Let's Code It!</span>

### 💡 Important Concepts

<div class="grid grid-cols-2 gap-6 mt-4 text-sm">

<div class="bg-green-50 p-4 border-l-4 border-green-400 rounded shadow-sm">
🌍 <strong>Embrace global state</strong><br/>
Realms *are* global — use them like APIs for shared data.
</div>

<div class="bg-red-50 p-4 border-l-4 border-red-400 rounded shadow-sm">
🚨 <strong>Fail fast with <code>panic</code></strong><br/>
Panic when assumptions break — stop execution and protect contract state.
</div>

<div class="bg-indigo-50 p-4 border-l-4 border-indigo-400 rounded shadow-sm col-span-2">
📖 <strong>Design for readability</strong><br/>
Code clarity beats cleverness — smart contracts are public infra.
</div>

</div>

---

# 🚀 <span class="text-amber-500">Coming Next</span>

- 📦 Deploy and test your smart contract  
- 🔐 Securely manage keys  
- 🌐 Interact with testnet  
- 📲 Invoke contracts safely  

<div class="text-center mt-4 text-sm op75">
🔧 Apply what you've learned in real-world scenarios!
</div>
