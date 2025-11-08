package visibility

// Public - Uppercase
var Balance int = 1000

// private - lowercase
var transactionCount int = 0

// Public function
func Withdraw(cur realm, amount int) {
	Balance -= amount
	incrementTxCount()
}

// private function
func incrementTxCount() {
	transactionCount++
}
