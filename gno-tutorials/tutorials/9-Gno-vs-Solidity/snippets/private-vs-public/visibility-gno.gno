package visibility

// Public - Uppercase
// private - lowercase
var Balance int = 1000
var transactionCount int = 0

func Withdraw(cur realm, amount int) {
	Balance -= amount
	incrementTxCount()
}

func incrementTxCount() {
	transactionCount++
}

func GetBalance() int {
	return Balance
}
