// src: https://gno.land/r/demo/counter$source

package counter

import "strconv"

var counter int

func Increment() {
	crossing()

	counter++
}

func Render(_ string) string {
	return strconv.Itoa(counter)
}
