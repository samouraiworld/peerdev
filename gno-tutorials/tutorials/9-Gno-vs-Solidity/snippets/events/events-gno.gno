package events

import (
	"chain"
	"chain/runtime"
)

func Transfer(to address, amount uint64) {
	// Transfer logic
	chain.Emit("Transfer",
		"from", runtime.PreviousRealm().Addr().String(),
		"to", to.String(),
		"amount", amount,
	)
}
