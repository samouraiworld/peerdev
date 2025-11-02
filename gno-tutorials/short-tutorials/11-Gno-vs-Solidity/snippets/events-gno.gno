package events

import (
    "std"
    "gno.land/p/demo/emit"
)

func Transfer(to std.Address, amount uint64) {
    // Transfer logic
    emit.Emit("Transfer", 
        "from", std.PrevRealm().Addr().String(),
        "to", to.String(),
        "amount", amount,
    )
}
