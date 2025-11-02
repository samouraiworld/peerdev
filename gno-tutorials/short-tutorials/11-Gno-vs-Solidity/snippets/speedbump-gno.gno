package speedbump

import (
    "std"
    "time"
    "gno.land/p/demo/avl"
)

var lastActionTime avl.Tree // Address -> time.Time
const DELAY = 24 * time.Hour

func AssertRateLimit() {
    caller := std.PrevRealm().Addr()
    lastTime, exists := lastActionTime.Get(caller.String())
    
    now := time.Now()
    if exists && now.Sub(lastTime.(time.Time)) < DELAY {
        panic("rate limit: please wait")
    }
    lastActionTime.Set(caller.String(), now)
}

func Withdraw() {
    AssertRateLimit()
    // Withdrawal logic
}
