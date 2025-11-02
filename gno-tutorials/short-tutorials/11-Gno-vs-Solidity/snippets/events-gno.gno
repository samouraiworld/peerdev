package events

import (
	"chain/runtime"

	"gno.land/p/demo/emit"
)

func Transfer(to address, amount uint64) {
	// Transfer logic
	emit.Emit("Transfer",
		"from", runtime.PreviousRealm().Addr().String(),
		"to", to.String(),
		"amount", amount,
	)
}
