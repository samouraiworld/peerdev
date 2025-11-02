package wallet

import "std"

func Deposit() {
    caller := std.PrevRealm().Addr()
    sent := std.GetOrigSend()
    
    if len(sent) == 0 {
        panic("no coins sent")
    }
    
    amount := sent[0].Amount
    balance := getBalance(caller)
    setBalance(caller, balance + amount)
}
