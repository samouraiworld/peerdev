package grc20

import (
	"gno.land/p/demo/tokens/grc20"
)

var (
	Token, privateLedger = grc20.NewToken("MyToken", "MTK", 6)
	UserTeller           = Token.CallerTeller()
)

func Transfer(cur realm, to address, amount int64) {
	err := UserTeller.Transfer(to, amount)
	if err != nil {
		panic(err.Error())
	}
}

func Mint(cur realm, to address, amount int64) {
	err := privateLedger.Mint(to, amount)
	if err != nil {
		panic(err.Error())
	}
}

func BalanceOf(addr address) int64 {
	return UserTeller.BalanceOf(addr)
}
