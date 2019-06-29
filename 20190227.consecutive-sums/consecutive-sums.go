// Consecutive Sums by Programming Praxis
//
// Given the positive integer 15, there are three ways to take consecutive
// positive integers that sum to 15: 1+2+3+4+5, 4+5+6 and 7+8.
//
// Your task is to write a program that, given a positive integer, finds all the
// ways that consecutive positive integers can sum to the target integer. When
// you are finished, you are welcome to read or run a suggested solution, or to
// post your own solution or discuss the exercise in the comments below.
//
// source: http://programmingpraxis.com/2019/02/12/consecutive-sums/

package main

import "fmt"

func consecute_sums(n int) [][]int {
	out := [][]int{}
	for i := 1; i < n; i++ {
		sum := i
		seq := []int{1}
		for j := i + 1; j < n; j++ {
			sum += j
			seq = append(seq, j)
			if sum == n {
				out = append(out, seq)
				break
			}
			if sum > n {
				break
			}
		}
	}
	return out
}

func main() {
	fmt.Println(consecute_sums(15))
}
