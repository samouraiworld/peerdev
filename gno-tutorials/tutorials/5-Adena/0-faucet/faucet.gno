package faucet

import (
	"std"
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

func TotalSupply() int64 {
	crossing()

	return UserTeller.TotalSupply()
}

func BalanceOf(owner std.Address) int64 {
	crossing()

	return UserTeller.BalanceOf(owner)
}

func Transfer(to std.Address, amount int64) {
	crossing()

	checkErr(UserTeller.Transfer(to, amount))
}

func Allowance(owner, spender std.Address) int64 {
	crossing()

	return UserTeller.Allowance(owner, spender)
}

func Approve(spender std.Address, amount int64) {
	crossing()

	checkErr(UserTeller.Approve(spender, amount))
}

func TransferFrom(from, to std.Address, amount int64) {
	crossing()

	checkErr(UserTeller.TransferFrom(from, to, amount))
}

func Faucet() {
	crossing()

	caller := std.PreviousRealm().Address()
	amount := int64(1_000 * 10_000)
	checkErr(privateLedger.Mint(caller, amount))
}

func Mint(to std.Address, amount int64) {
	crossing()

	Ownable.AssertOwnedByCurrent()
	checkErr(privateLedger.Mint(to, amount))
}

func Burn(from std.Address, amount int64) {
	crossing()

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
		owner := std.Address(parts[1])
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
