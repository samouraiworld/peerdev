package grc20

import (
	"gno.land/p/demo/tokens/grc20"
)

var (
	Token, privateLedger = grc20.NewToken("MyToken", "MTK", 6)
	UserTeller           = Token.CallerTeller()
)

func Transfer(cur realm, to address, amount int64) {
	checkErr(UserTeller.Transfer(to, amount))
}

func BalanceOf(addr address) int64 {
	return UserTeller.BalanceOf(addr)
}

func Mint(cur realm, to address, amount int64) {
	checkErr(privateLedger.Mint(to, amount))
}

func checkErr(err error) {
	if err != nil {
		panic(err.Error())
	}
}
