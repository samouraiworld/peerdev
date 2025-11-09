package proxy

import "gno.land/p/nt/ownable"

var implRealm Logic
var owner = ownable.New()

type Logic interface {
	Execute(args string) error
}

func Upgrade(cur realm, newImpl Logic) {
	owner.AssertOwnedByPrevious()
	implRealm = newImpl
}

func GetImplementation() Logic {
	return implRealm
}

func Execute(cur realm, args string) {
	if implRealm == nil {
		panic("no implementation set")
	}
	err := implRealm.Execute(args)
	if err != nil {
		panic(err.Error())
	}
}
