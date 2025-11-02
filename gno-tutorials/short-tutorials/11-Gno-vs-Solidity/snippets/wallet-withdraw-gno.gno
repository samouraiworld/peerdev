package wallet

import "std"

var balances avl.Tree // Address -> uint64

func Withdraw(amount uint64) {
    caller := std.PrevRealm().Addr()
    balance := getBalance(caller)
    if balance < amount {
        panic("insufficient balance")
    }
    setBalance(caller, balance - amount)
    banker.SendCoins(caller, std.Coins{{amount, "ugnot"}})
}
