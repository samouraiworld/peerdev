package faucet

import (
	"chain/runtime"
	"strings"

	"gno.land/p/demo/grc/grc20"
	"gno.land/p/demo/ownable"
	"gno.land/p/demo/ufmt"
)

var (
	Token, privateLedger = grc20.NewToken("adena-coin", "ADN", 4)
	UserTeller           = Token.CallerTeller()
	Ownable              = ownable.NewWithAddress("g1manfred47kzduec920z88wfr64ylksmdcedlf5")
)

func init() {
	privateLedger.Mint(Ownable.Owner(), 1_000_000*10_000)
}

func TotalSupply(cur realm) int64 {

	return UserTeller.TotalSupply()
}

func BalanceOf(cur realm, owner address) int64 {

	return UserTeller.BalanceOf(owner)
}

func Transfer(cur realm, to address, amount int64) {

	checkErr(UserTeller.Transfer(to, amount))
}

func Allowance(cur realm, owner, spender address) int64 {

	return UserTeller.Allowance(owner, spender)
}

func Approve(cur realm, spender address, amount int64) {

	checkErr(UserTeller.Approve(spender, amount))
}

func TransferFrom(cur realm, from, to address, amount int64) {

	checkErr(UserTeller.TransferFrom(from, to, amount))
}

func Faucet(cur realm) {

	caller := runtime.PreviousRealm().Address()
	amount := int64(1_000 * 10_000)
	checkErr(privateLedger.Mint(caller, amount))
}

func Mint(cur realm, to address, amount int64) {

	Ownable.AssertOwnedByCurrent()
	checkErr(privateLedger.Mint(to, amount))
}

func Burn(cur realm, from address, amount int64) {

	Ownable.AssertOwnedByCurrent()
	checkErr(privateLedger.Burn(from, amount))
}

func Render(path string) string {
	parts := strings.Split(path, "/")
	c := len(parts)

	switch {
	case path == "":
		return Token.RenderHome()
	case c == 2 && parts[0] == "balance":
		owner := address(parts[1])
		balance := UserTeller.BalanceOf(owner)
		return ufmt.Sprintf("%d\n", balance)
	default:
		return "404\n"
	}
}

func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}
