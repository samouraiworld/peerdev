package proxy

import "gno.land/p/nt/ownable"

var implementation address // implementation address
var owner = ownable.New()

func Upgrade(cur realm, newImpl address) {
	owner.AssertOwnedByPrevious()
	implementation = newImpl
}

func GetImplementation() address {
	return implementation
}

// Note: Gno doesn't support delegatecall like Solidity
// Instead, use interface-based composition:
//
// type Logic interface {
//     Execute(args string) string
// }
//
// func Call(args string) string {
//     // Import and call the implementation realm directly
//     return implRealm.Execute(args)
// }
