package wallet

import (
	"chain/banker"
	"chain/runtime"
)

func Deposit() {
	caller := runtime.PreviousRealm().Addr()
	sent := banker.OriginSend()

	if len(sent) == 0 {
		panic("no coins sent")
	}

	amount := sent[0].Amount
	balance := getBalance(caller)
	setBalance(caller, balance+amount)
}
