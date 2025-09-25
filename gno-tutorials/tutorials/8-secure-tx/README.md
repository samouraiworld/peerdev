```bash
gnokey query -remote "tcp://127.0.0.1:26657" auth/accounts/ADDRESS
gnokey maketx call -pkgpath "gno.land/r/demo/foo20" -func "Faucet"  -gas-fee 1000000ugnot -gas-wanted 5000000 -send "" ADDRESS > call.tx
gnokey sign -tx-path call.tx -chainid "dev" -account-number ACCOUNTNUMBER -account-sequence SEQUENCENUMBER ADDRESS
gnokey broadcast -remote "tcp://127.0.0.1:26657" call.tx
```
