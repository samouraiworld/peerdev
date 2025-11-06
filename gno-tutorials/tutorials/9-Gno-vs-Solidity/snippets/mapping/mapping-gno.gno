package mapping

import "gno.land/p/demo/avl"

var balances avl.Tree // Address -> uint64
var registry avl.Tree // string -> Address

func Set(key string, value address) {
	registry.Set(key, value)
}

func Get(key string) address {
	val, _ := registry.Get(key)
	return val.(address)
}
