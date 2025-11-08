package ownable

import (
	"chain/runtime"
)

var owner address

func init() {
	owner = runtime.PreviousRealm().Address()
}

func AssertIsOwner() {
	if runtime.PreviousRealm().Address() != owner {
		panic("not owner")
	}
}

func RestrictedAction(cur realm) error {
	AssertIsOwner()
	// Only owner can call
	return nil
}
