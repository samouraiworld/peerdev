package mapping

import "gno.land/p/demo/avl"

var balances avl.Tree // Address -> uint64
var registry avl.Tree // string -> Address

func Set(key string, value std.Address) {
    registry.Set(key, value)
}

func Get(key string) std.Address {
    val, _ := registry.Get(key)
    return val.(std.Address)
}
