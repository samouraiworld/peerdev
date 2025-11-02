package ownable

import "chain/runtime"

var owner address

func init() {
	owner = runtime.PreviousRealm().Addr()
}

func AssertIsOwner() {
	if runtime.PreviousRealm().Addr() != owner {
		panic("not owner")
	}
}

func RestrictedAction() error {
	AssertIsOwner()
	// Only owner can call
	return nil
}
