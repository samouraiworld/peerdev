package counter

import "strconv"

var counter int

func Increment() {
	counter++
}

func Render(_ string) string {
	return strconv.Itoa(counter)
}
