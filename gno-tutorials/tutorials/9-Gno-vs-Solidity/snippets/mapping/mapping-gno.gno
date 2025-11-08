package mapping

import "gno.land/p/nt/avl"

var balances avl.Tree // address -> int64

func SetBalance(cur realm, addr address, amount int64) {
	balances.Set(addr.String(), amount)
}

func GetBalance(addr address) int64 {
	balance, exists := balances.Get(addr.String())
	if !exists {
		return 0
	}
	return balance.(int64)
}
