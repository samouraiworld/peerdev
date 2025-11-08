package events

import (
	"chain"
	"chain/runtime"
	"strconv"
)

func Transfer(cur realm, to address, amount int64) {
	// Transfer logic
	chain.Emit("Transfer",
		"from", runtime.PreviousRealm().Address().String(),
		"to", to.String(),
		"amount", strconv.Itoa(int(amount)),
	)
}
