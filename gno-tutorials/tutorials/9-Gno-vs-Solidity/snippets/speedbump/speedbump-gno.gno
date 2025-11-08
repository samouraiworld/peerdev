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

	now := time.Now()
	if exists && now.Sub(lastTime.(time.Time)) < DELAY {
		panic("rate limit: please wait")
	}
	lastActionTime.Set(caller.String(), now)
}

func Withdraw(cur realm) {
	AssertRateLimit()
	// Withdrawal logic
}
