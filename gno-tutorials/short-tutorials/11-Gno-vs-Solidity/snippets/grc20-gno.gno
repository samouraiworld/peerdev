package grc20

import (
	"chain/runtime"

	"gno.land/p/demo/grc/grc20"
)

var banker *grc20.Banker

func Transfer(to address, amount uint64) error {
	caller := runtime.PreviousRealm().Addr()
	return banker.Transfer(caller, to, amount)
}
