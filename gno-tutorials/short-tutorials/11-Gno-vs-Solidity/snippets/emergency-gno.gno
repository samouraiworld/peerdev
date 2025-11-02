package emergency

import "gno.land/p/demo/ownable"

var stopped bool = false

func AssertNotStopped() {
	if stopped {
		panic("contract stopped")
	}
}

func EmergencyStop() {
	ownable.AssertCallerIsOwner()
	stopped = true
}

func Resume() {
	ownable.AssertCallerIsOwner()
	stopped = false
}

func DoSomething() {
	AssertNotStopped()
	// Normal logic
}
