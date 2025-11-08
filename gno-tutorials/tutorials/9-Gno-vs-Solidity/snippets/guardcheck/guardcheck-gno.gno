package guardcheck

func AssertValidAmount(amount int64) {
	if amount <= 0 {
		panic("amount must be positive")
	}
	if amount > 1000 {
		panic("amount too large")
	}
}

func Transfer(cur realm, amount int64) {
	AssertValidAmount(amount)
	// Transfer logic
}
