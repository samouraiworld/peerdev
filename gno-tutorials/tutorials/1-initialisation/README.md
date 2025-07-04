# Initialisating Gno.land project
## Goals
- Install gno.land
- Test a counter **Realm** in local

## Dependency
- make
- go
- git

## Clone gnoland 
```
git clone git@github.com:gnolang/gno.git
```
Then run
```bash
cd gno
make install
```
Binaries are available in `~/go/bin` after installation.

## Export environment variable 
To be able to access `gnodev`, `gnokey`, `gno`  necessary for developing, you will need to add in your shell config:

For bash, zsh, etc.
```bash
export PATH=$PATH:$HOME/go/bin
```

For fish shell users
```bash
set -gx PATH $PATH $HOME/go/bin
```

## Test locally 
In the directory of your project containing `*.gno` and `gnomod.toml` files, run:
```bash
gnodev .
```

If done great, you can explore Gno using Gnoweb, hosted by `gnodev .`

```bash
[I] davd@davd ~/P/p/gno-tutorials (main)> gnodev .
Accounts    ┃ W default address created name=_default#g1jg8m addr=g1jg8mtutu9khhfwc4nxmuhcpftf0pajdhfvsqf5 mnemonic="source bonus chronic canvas draft south burst lottery vacant surface solve popular case indicate oppose farm nothing bullet exhibit title speed wink action roast"
Proxy       ┃ I lazy loading is enabled. packages will be loaded only upon a request via a query or transaction. loader=root<gno-tutorials>/root<examples>
GnoWeb      ┃ I gnoweb started lisn=http://127.0.0.1:8888
--- READY   ┃ I for commands and help, press `h` took=1.825930883s
Event       ┃ I sending event to clients clients=0 type=NODE_RESET event={}
```
```
GnoWeb      ┃ I gnoweb started lisn=http://127.0.0.1:8888
```

## Your first realm: Counter realm `0_counter.gno`

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

- `package` -> Name of your package.
- `import` -> Library imported from `gno.land/p/...`, available on the [official gno.land repository](https://github.com/gnolang/gno)
- `Increment` -> Increment `counter` variable. 
Function only callable by *crossing* function necessary when interacting with public function.
 `func Increment(cur realm)` is set as crossing by adding `cur realm` to its parameters,
- `Render` -> Display a markdown rendered content.
