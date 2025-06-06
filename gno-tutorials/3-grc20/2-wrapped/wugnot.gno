package wugnot

import (
	"std"
	"strings"

	"gno.land/p/demo/grc/grc20"
	"gno.land/p/demo/ufmt"
	"gno.land/r/demo/grc20reg"
)

var Token, adm = grc20.NewToken("wrapped GNOT", "wugnot", 0)
var userTeller = Token.CallerTeller()

const (
	ugnotMinDeposit  int64 = 1000
	wugnotMinDeposit int64 = 1
)

func init() {
	cross(grc20reg.Register)(Token, "")
}

func Deposit() {
	crossing()

	caller := std.PreviousRealm().Address()
	sent := std.OriginSend()
	amount := sent.AmountOf("ugnot")

	require(int64(amount) >= ugnotMinDeposit, ufmt.Sprintf("Deposit below minimum: %d/%d ugnot.", amount, ugnotMinDeposit))

	checkErr(adm.Mint(caller, int64(amount)))
}

func Withdraw(amount int64) {
	crossing()

	require(amount >= wugnotMinDeposit, ufmt.Sprintf("Deposit below minimum: %d/%d wugnot.", amount, wugnotMinDeposit))

	caller := std.PreviousRealm().Address()
	pkgaddr := std.CurrentRealm().Address()
	callerBal := Token.BalanceOf(caller)
	require(amount <= callerBal, ufmt.Sprintf("Insufficient balance: %d available, %d needed.", callerBal, amount))

	// send swapped ugnots to qcaller
	stdBanker := std.NewBanker(std.BankerTypeRealmSend)
	send := std.Coins{{"ugnot", int64(amount)}}
	stdBanker.SendCoins(pkgaddr, caller, send)
	checkErr(adm.Burn(caller, amount))
}

func Render(path string) string {
	crossing()
	parts := strings.Split(path, "/")
	c := len(parts)

	switch {
	case path == "":
		return Token.RenderHome()
	case c == 2 && parts[0] == "balance":
		owner := std.Address(parts[1])
		balance := Token.BalanceOf(owner)
		return ufmt.Sprintf("%d", balance)
	default:
		return "404"
	}
}

func TotalSupply() int64 {
	crossing()
	return Token.TotalSupply()
}

func BalanceOf(owner std.Address) int64 {
	crossing()
	return Token.BalanceOf(owner)
}

func Allowance(owner, spender std.Address) int64 {
	crossing()
	return Token.Allowance(owner, spender)
}

func Transfer(to std.Address, amount int64) {
	crossing()

	checkErr(userTeller.Transfer(to, amount))
}

func Approve(spender std.Address, amount int64) {
	crossing()

	checkErr(userTeller.Approve(spender, amount))
}

func TransferFrom(from, to std.Address, amount int64) {
	crossing()

	checkErr(userTeller.TransferFrom(from, to, amount))
}

func require(condition bool, msg string) {
	if !condition {
		panic(msg)
	}
}

func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}
