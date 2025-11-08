package factory

import (
	"chain"
	"chain/runtime"

	"gno.land/p/nt/avl"
	"gno.land/p/nt/fqname"
)

var registry = avl.NewTree() // pkgPath[.slug] -> *Contract

// Register allows contracts to register themselves in the factory
func Register(cur realm, contract *Contract, slug string) {
	pkgPath := runtime.PreviousRealm().PkgPath()
	key := fqname.Construct(pkgPath, slug)
	registry.Set(key, contract)
	chain.Emit(
		"register",
		"pkgpath", pkgPath,
		"slug", slug,
	)
}

func Get(key string) *Contract {
	contract, ok := registry.Get(key)
	if !ok {
		return nil
	}
	return contract.(*Contract)
}

type Contract struct {
	Name string
	// Add your contract fields here
}
