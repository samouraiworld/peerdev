package grc20

import "gno.land/p/demo/grc/grc20"

var banker *grc20.Banker

func Transfer(to std.Address, amount uint64) error {
    caller := std.PrevRealm().Addr()
    return banker.Transfer(caller, to, amount)
}
