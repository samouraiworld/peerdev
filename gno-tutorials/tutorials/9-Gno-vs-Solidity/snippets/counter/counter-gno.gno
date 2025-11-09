package counter

var count uint64

func Increment(cur realm) {
	count++
}

func GetCount() uint64 {
	return count
}
