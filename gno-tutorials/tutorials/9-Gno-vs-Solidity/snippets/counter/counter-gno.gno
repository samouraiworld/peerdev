package counter

var count int

func Increment(cur realm) {
	count++
}

func GetCount() int {
	return count
}
