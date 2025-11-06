package guardcheck

func AssertValidAmount(amount uint64) {
	if amount == 0 {
		panic("amount must be positive")
	}
	if amount > 1000 {
		panic("amount too large")
	}
}

func Transfer(amount uint64) {
	AssertValidAmount(amount)
	// Transfer logic
}
