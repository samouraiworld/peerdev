# Add package

```bash
gnokey maketx addpkg \
  --pkgpath "gno.land/r/demo/counter" \
  --pkgdir "./counter" \
  --gas-fee "1_000_000ugnot" \
  --gas-wanted 2_000_000 \
  --broadcast \
  --chainid "staging" \
  --remote "https://rpc.gno.land:443" \
  MyKey
```