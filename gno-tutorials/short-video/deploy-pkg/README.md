# Add package

```bash
gnokey maketx addpkg \
  --pkgpath "gno.land/r/demo/counter" \
  --pkgdir "./counter" \
  --gas-fee "1000000ugnot" \
  --gas-wanted 2000000 \
  --broadcast \
  --chainid "staging" \
  --remote "https://rpc.gno.land:443" \
  MyKey
```