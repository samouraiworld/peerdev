package wallet

import (
	"chain/banker"
	"chain/runtime"

	"gno.land/p/nt/avl"
)

var balances avl.Tree // address -> int64

func Deposit(cur realm) {
	caller := runtime.PreviousRealm().Address()
	sent := banker.OriginSend()

	if len(sent) == 0 {
		panic("no coins sent")
	}

	amount := sent[0].Amount
	balance := getBalance(caller)
	setBalance(caller, balance+amount)
}

func getBalance(addr address) int64 {
	balance, exists := balances.Get(addr.String())
	if !exists {
		return 0
	}
	return balance.(int64)
}

func setBalance(addr address, amount int64) {
	balances.Set(addr.String(), amount)
}
