package statelock

type State int

const (
	Open State = iota
	Closed
	Paused
)

var state State = Open

func AssertState(expected State) {
	if state != expected {
		panic("invalid state")
	}
}

func DoSomething() {
	AssertState(Open)
	// Only callable when Open
}
