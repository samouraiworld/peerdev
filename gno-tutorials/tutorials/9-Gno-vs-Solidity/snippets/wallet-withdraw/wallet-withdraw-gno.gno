package wallet

import (
	"chain"
	"chain/banker"
	"chain/runtime"

	"gno.land/p/nt/avl"
)

var balances avl.Tree // Address -> int64

func Withdraw(cur realm, amount int64) {
	caller := runtime.PreviousRealm().Address()
	balance := getBalance(caller)
	if balance < amount {
		panic("insufficient balance")
	}
	setBalance(caller, balance-amount)
	
	// Send coins using banker
	bnk := banker.NewBanker(banker.BankerTypeRealmSend)
	bnk.SendCoins(runtime.CurrentRealm().Address(), caller, chain.Coins{{Denom: "ugnot", Amount: amount}})
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
