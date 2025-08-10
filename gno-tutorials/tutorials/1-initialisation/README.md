# Welcome to Gnoland!

## 🚀 Initializing a Gno.land Project

## Goals
- Install gno.land
- Test a counter **Realm** in local

## ⚙️ Dependencies
- `make`
- `go` (v1.21+ recommended)
- `git`

---


## 🛠️ Installation Steps

### 1. Clone the Gno Repository
```bash
git clone git@github.com:gnolang/gno.git
cd gno
```

### 2. Build and Install
```bash
make install
```
This installs binaries in `~/go/bin`:
- `gnodev`: Local development environment
- `gnokey`: Key management
- `gno`: Gno toolchain

### 3. Configure Environment
Add to your shell config:

```bash
# Bash/Zsh
export PATH=$PATH:$HOME/go/bin

# Fish
set -gx PATH $PATH $HOME/go/bin
```

---

## 🧪 Test Your First Realm

### 1. Clone Sample Project
```bash
git clone git@github.com:samouraiworld/peerdev.git
cd peerdev/tutorials/1-initialisation
```

### 2. Start Local Node
In the directory containing the `*.gno` and `gnomod.toml` files (`/tutorials/1-initialisation`), run:
```bash
gnodev .
```

Output:
```bash
~/P/p/gno-tutorials > gnodev .
Accounts    ┃ W default address created 
GnoWeb      ┃ I gnoweb started lisn=http://127.0.0.1:8888
--- READY   ┃ I for commands and help, press `h` took=1.825930883s
```

### 3. Access GnoWeb
Open in browser: [http://127.0.0.1:8888](http://127.0.0.1:8888)

---

## 🧱 Your first realm: Counter realm (`0_counter.gno`)

This Realm display the value of the `counter` variable.
When calling `Increment`, it add +1 to its result.

```go
package counter 

import "strconv"

var counter int = 0

func Increment(cur realm) {
	counter++
}

func Render(_ string) string {
	return strconv.Itoa(counter)
}
```

| Component         | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `package counter` | Realm name (deployed as `gno.land/r/counter`)                               |
| `strconv`         | Pure package imported from `gno.land/p/...`, available on the [official gno.land repository](https://github.com/gnolang/gno)|
| `cur realm`       | Marks `Increment()` as a state-modifying function (requires transaction fee)|
| `Render()`        | Returns markdown content shown on the Realm's page                          |
