# How2Transaction

## Call
```bash
gnokey maketx call \
  --pkgpath "gno.land/r/demo/boards" \
  --func "CreateThread" \
  --args "Crypto" \
  --gas-fee 1gnot \
  --gas-wanted 10000 \
  mykeyname
```

## Run
```bash
gnokey maketx run \
  # Gas fees
  --gas-fee 1gnot \
  --gas-wanted 10000 \

  # Key
  mykeyname \

  # Transaction Script
  ./myscript
```

## Addpkg
```bash
gnokey maketx addpkg \
  # Required parameters
  --pkgpath "gno.land/r/demo/token" \
  --pkgdir "." \
  --deposit "1000gnot" \

  # Gas fees + Key
  --gas-fee 1gnot \
  --gas-wanted 10000 \
   mykeyname
```

## Send
```bash 
gnokey maketx send \
  # Required parameters
  --send "100gnot" \
  --to g1qkm0xhj8nsm2l3g50ttazxhlq7fs47myhxqk79 \

  # Gas fees + Key
  --gas-fee 1gnot \
  --gas-wanted 10000 \
   mykeyname
```


# 🛠 Practical Examples


**1. Deploy Contract**
```bash
gnokey maketx addpkg --pkgpath "gno.land/r/mydapp/token" --gas-fee 1gnot --gas-wanted 10000 \
  --broadcast --chainid "staging" --remote "https://rpc.gno.land:443" key
```

**2. Mint Tokens**
```bash
gnokey maketx call --pkgpath "gno.land/r/mydapp/token" --func "Mint" --gas-fee 1gnot --gas-wanted 10000 \
  --broadcast -chainid "dev" -remote "tcp://127.0.0.1:26657" key
```

**3. Run Setup Script**
```bash
gnokey maketx run ./script.gno --gas-fee 1gnot --gas-wanted 10000 \
  --broadcast -chainid "dev" -remote "tcp://127.0.0.1:26657" key
```

**4. Transfer Funds**
```bash
gnokey maketx send --to g1friendaddress --send "50gnot" --gas-fee 1gnot --gas-wanted 10000 \
  --broadcast --chainid "staging" --remote "https://rpc.gno.land:443" key
```