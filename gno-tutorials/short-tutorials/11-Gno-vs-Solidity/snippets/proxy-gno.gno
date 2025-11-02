package proxy

import "gno.land/p/demo/ownable"

var implementation string // realm path

func Upgrade(newImpl string) {
	ownable.AssertCallerIsOwner()
	implementation = newImpl
}

func Call(method string, args ...interface{}) interface{} {
	// Delegate to implementation realm
	// Note: Direct delegation not yet supported
	// Use interface-based composition instead
	return callRealm(implementation, method, args...)
}

// Alternative: Use DAO pattern like GovDAO
// with UpdateImpl() to switch implementations
