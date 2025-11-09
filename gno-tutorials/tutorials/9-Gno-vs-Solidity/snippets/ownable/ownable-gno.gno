package ownable

import (
	"gno.land/p/nt/ownable"
)

var o *ownable.Ownable

func init() {
	o = ownable.NewWithOrigin()
}

func RestrictedAction(cur realm) {
	o.AssertOwnedByPrevious()
	// Only owner can call
}

func TransferOwnership(cur realm, newOwner address) {
	err := o.TransferOwnership(newOwner)
	if err != nil {
		panic(err)
	}
}

func GetOwner() address {
	return o.Owner()
}
