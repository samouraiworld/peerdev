// src: https://gno.land/r/demo/counter$source

package counter

import "strconv"

var counter int

func Increment(cur realm) {

	counter++
}

func Render(_ string) string {
	return strconv.Itoa(counter)
}
