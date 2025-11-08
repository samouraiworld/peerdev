package emergency

import "gno.land/p/nt/ownable"

var stopped bool = false
var owner = ownable.New()

func AssertNotStopped() {
	if stopped {
		panic("contract stopped")
	}
}

func EmergencyStop(cur realm) {
	owner.AssertOwnedByPrevious()
	stopped = true
}

func Resume(cur realm) {
	owner.AssertOwnedByPrevious()
	stopped = false
}

func DoSomething(cur realm) {
	AssertNotStopped()
	// Normal logic
}
