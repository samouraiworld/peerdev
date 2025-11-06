package factory

import "gno.land/p/nt/avl"

var contracts avl.Tree // realm_path -> instance

func CreateContract(name string) string {
	// Create new realm dynamically
	path := "gno.land/r/demo/" + name
	// Note: Dynamic realm creation not yet supported
	// Use sub-packages or registry pattern instead
	contracts.Set(path, &Contract{})
	return path
}
