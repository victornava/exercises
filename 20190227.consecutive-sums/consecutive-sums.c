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


#include <stdio.h>

void print_sequence(int from, int to) {
    printf("[");
    for (int i = from; i <= to; i++) {
        i != to ? printf("%d, ", i) : printf("%d", i);
    }
    printf("]\n");
}

int main() {
    int n = 15;
    int sum, i, j;

    for (i = 1; i < n; i++) {
        sum = i;
        for (j = i+1; j < n; j++) {
            sum += j;
            if (sum == n) {
                print_sequence(i, j);
                break;
            }
            if (sum > n)
                break;
        }
    }
    return 0;
}

