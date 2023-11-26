// 2020-06-26
//
// Summing A String
//
// In a string consisting of digits and other non-digit characters, the digits
// form an embedded series of positive integers. For instance, the string
// "123abc45def" contains the embedded integers 123 and 45, which sum to 168.
//
// Your task is to write a program that takes a string and writes the sum of the
// integers embedded in the string. When you are finished, you are welcome to
// read or run a suggested solution, or to post your own solution or discuss the
// exercise in the comments below.
//
// source: https://programmingpraxis.com/2020/06/19/summing-a-string/

package main

import (
	"fmt"
	"os"
	"regexp"
	"strconv"
)

func main() {
	sum := 0
	str := os.Args[1]
	re := regexp.MustCompile(`\d+`)

	for _, s := range re.FindAllString(str, -1) {
		n, _ := strconv.Atoi(s)
		sum += n
	}

	fmt.Println(sum)
}

// Example:
// go run 2020.summing-a-string.go '123abc45def'
// 168
