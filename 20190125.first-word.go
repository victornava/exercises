// source: https://programmingpraxis.com/2019/01/25/first-word/
//
// First Word by programmingpraxis
//
// We have a simple exercise today, inspired a co-worker. Where I work, we have
// a reporting tool that permits a "hook" to the underlying SQL in some places.
// My co-worker asked me how to write an SQL statement that extracts the first
// word (a maximal sequence of non-spaces) from the beginning of a string
// (assume there are no leading spaces). For instance, given the string "abcdefg
// hijklmnop qrs tuv wxyz" the first word is "abcdefg". Here's the SQL
// expression, wrapped in a select statement, with &&STR representing the
// string:
//
//		select substr('&&STR', 1, instr('&&STR', ' ') - 1) from dual
//
// Your task is to write a program to extract the first word from a string.

package main

import (
	"fmt"
	"regexp"
)

func main() {
	s1 := "abcdefg hijklmnop qrs tuv wxyz"
	s2 := "~hola   caracola  de piazzolla"
	fmt.Println(firstWordWithLoop(s1))
	fmt.Println(firstWordWithRegexp(s1))
	fmt.Println()
	fmt.Println(firstWordWithLoop(s2))
	fmt.Println(firstWordWithRegexp(s2))
}

func firstWordWithLoop(str string) string {
	word := ""
	for _, char := range str {
		if char == ' ' {
			break
		}
		word += string(char)
	}
	return word
}

func firstWordWithRegexp(str string) string {
	return regexp.MustCompile(`[^ ]+`).FindString(str)
}
