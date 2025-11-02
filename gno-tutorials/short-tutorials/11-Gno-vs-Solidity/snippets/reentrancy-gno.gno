package reentrancy

var locked bool

func AssertNotLocked() {
    if locked {
        panic("reentrant call")
    }
    locked = true
}

func Unlock() {
    locked = false
}

func Withdraw() {
    AssertNotLocked()
    defer Unlock()
    // Safe withdrawal
}
