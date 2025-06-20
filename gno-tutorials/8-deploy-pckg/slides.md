---
title: Deploying Packages on Gno.land
theme: ../theme
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 📦 Deploying Packages on Gno.land
## Building and Publishing Smart Contracts

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

<v-grid columns="2" gap="4">

### 💻 Pure Packages
- Stateless computation
- Deterministic functions
- No persistent storage
- `.gno` file extension
```go
package demo

func Add(a, b int) int {
    return a + b
}
```

### 🌐 Realm Packages
- Stateful applications
- Persistent storage
- `.realm` file extension
```go
package demo

var counter int

func Increment() {
    counter++
}
```

</v-grid>

---
layout: top-title
color: purple
---

:: title ::
# 🚀 Deployment Workflow
:: content ::

### Step-by-Step Process:
1. **Write** package code
2. **Test** locally with `gno test`
3. **Build** with `gno build`
4. **Deploy** with `gnokey maketx`
5. **Verify** on testnet/mainnet

---
layout: top-title
color: green
---

:: title ::
# 🔧 Deployment Commands
:: content ::

// TODO reverify this cmds
### Package Deployment
```bash
gnokey maketx addpkg \
  --pkgpath "gno.land/r/demo/counter" \ # Or "gno.land/p/..."
  --pkgdir "./counter" \
  --deposit "1gnot" \
  --gas-fee "1gnot" \
  --gas-wanted 200 \
  --broadcast \
  --chainid "testnet"
  --remote "testnet.gno.land:36657" \
  MyKey
```

### Initialization Arguments
```bash
--args '{"initial_value": 100}'
```

---
layout: top-title
color: orange
---

:: title ::
# 🧪 Testing Strategies
:: content ::

### Filetest Convention
```tree
math/
├── math.gno
├── math_test.gno
└── math_filetest.gno
```

### Test Execution
```bash
# Run unit tests
gno test math_test.gno

# Run filetests
gno test math_filetest.gno
```

### Filetest Example
```go
// math_filetest.gno
package math_test

import "testing"

func TestAdd(t *testing.T) {
    got := math.Add(2, 3)
    want := 5
    if got != want {
        t.Fatalf("expected %d, got %d", want, got)
    }
}
```

---
layout: top-title
color: teal
---

:: title ::
# 🔐 Namespace Rules
:: content ::

### Path Structure
```bash
gno.land/[p|r]/[owner]/[package]
```

### Ownership Rules:
1. **Registered users**: `gno.land/p/david/math`
2. **Anonymous users**: `gno.land/p/g1abc...xyz/math`

### Deployment Rights:
- Only namespace owner can deploy
- Requires correct signing key
- Minimum 1 gnot deposit

---
layout: center
---

# 🧭 Verification & Debugging

```bash
# Check transaction status
gnokey query tx --remote testnet.gno.land:36657 [TX_HASH]

# View package code
curl https://testnet.gno.land/r/demo/counter

# Test deployed package
gnokey maketx call \
  --pkgpath "gno.land/r/demo/counter" \
  --func "Increment" \
  --args "" \
  --gas-fee "1gnot" \
  --gas-wanted 200
  MyKey
```

**Common Issues:**
- Insufficient gas
- Wrong chain ID
- Invalid package path
- Missing dependencies

---
layout: center
---

# 🏁 Best Practices

1. **Always test locally** before deployment
2. **Start with testnet** before mainnet
3. **Use version control** for packages
4. **Verify transactions** after deployment
5. **Optimize gas** through iteration
6. **Secure your keys** with proper storage

**Resources:**
- [Gno Documentation](https://docs.gno.land)
- [Examples Repository](https://github.com/gnolang/gno/examples)
- [Testnet Explorer](https://testnet.gno.land)
- [Community Discord](https://discord.gg/gnoland)