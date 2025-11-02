package wallet

import (
	"chain"
	"chain/runtime"

	"gno.land/p/demo/avl"
)

var balances avl.Tree // Address -> uint64

func Withdraw(amount uint64) {
	caller := runtime.PreviousRealm().Addr()
	balance := getBalance(caller)
	if balance < amount {
		panic("insufficient balance")
	}
	setBalance(caller, balance-amount)
	banker.SendCoins(caller, chain.Coins{{amount, "ugnot"}})
}
