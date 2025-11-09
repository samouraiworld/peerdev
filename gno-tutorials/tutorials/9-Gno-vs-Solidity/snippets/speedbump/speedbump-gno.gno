package speedbump

import (
	"chain/runtime"
	"time"

	"gno.land/p/nt/avl"
)

var lastActionTime avl.Tree // Address -> time.Time
const DELAY = 24 * time.Hour

func AssertRateLimit() {
	caller := runtime.PreviousRealm().Address()
	lastTime, exists := lastActionTime.Get(caller.String())

	timeNow := time.Now()
	if exists && timeNow.Sub(lastTime.(time.Time)) < DELAY {
		panic("rate limit: please wait")
	}
	lastActionTime.Set(caller.String(), timeNow)
}

func Withdraw(cur realm) {
	AssertRateLimit()
	// Withdrawal logic
}
