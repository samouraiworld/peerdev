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
