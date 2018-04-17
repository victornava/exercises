// source: https://programmingpraxis.com/2018/04/13/third-biggest-number
// Write a program to read ten numbers input by the user and write the third
// largest of those ten numbers.

// Assumes clean input of positive integers.
// Having go with go

package main

import (
	"fmt"
	"sort"
)

func main() {
	numbers := make([]int, 10)

	// Get numbers from user
	for i := range numbers {
		fmt.Print("Enter a number: ")
		fmt.Scan(&numbers[i])
	}

	// Remove duplicates
	uniqNumbers := []int{}
	m := make(map[int]bool)
	for _, x := range numbers {
		m[x] = true
	}
	for k, _ := range m {
		uniqNumbers = append(uniqNumbers, k)
	}

	if len(uniqNumbers) < 3 {
		fmt.Println("Nop")
		return
	}

	// Sort in descending order
	sort.Sort(sort.Reverse(sort.IntSlice(numbers)))
	fmt.Println("Third lagest is:", numbers[2])
}
