---
title: Deploying Packages on Gno.land
theme: ../../theme
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 📦 Deploying Packages on Gno.land
The complete guide to deploying Gno packages

<!-- 
Focus on:
- Pure vs Realm packages
- Deployment workflow
- Testing strategies
-->

---
layout: top-title
color: blue
---

:: title ::
# 📦 Package Types
:: content ::


#### 💻 Pure Packages (`/p/namespace/...`)
- No persistent storage

```go
package demo

func Add(a, b int) int {
    return a + b
}
```

#### 🌐 Realm Packages (`/r/namespace/...`)
- Persistent storage

```go
package demo

var counter int

func Increment() {
    counter++
}
```

---
layout: top-title
color: green
---

:: title ::
# 🔧 Deployment Commands
:: content ::

### Package Deployment
```bash
gnokey maketx addpkg \
  --pkgpath "gno.land/r/demo/counter" \
  --pkgdir "./counter" \
  --deposit "1gnot" \
  --gas-fee "1gnot" \
  --gas-wanted 200 \
  --broadcast \
  --chainid "staging" \
  --remote "https://rpc.gno.land:443" \
  MyKey
```

---
layout: top-title
color: teal
---

:: title ::
# 🔐 Namespace Rules
:: content ::

#### Path Structure
```bash
gno.land/[p|r]/[owner]/[package]
```

#### Ownership Rules:
1. **Registered users**: `gno.land/p/david/math`
2. **Anonymous users**: `gno.land/p/g1abc...xyz/math`
3. **Gno owned packages**: `gno.land/r/sys/vals`

#### Deployment Rights:
- Only namespace owner can deploy
- Requires correct signing key
