// Fizzbuzz
//
// Enumerate the numbers from 1 to N by writing "Fizz" if the number is
// divisible by 3, "Buzz" if the number is divisible by 5, "FizzBuzz" if the
// number is divisible by both, . For instance, counting from 1 to 25 works like
// this:
//
// 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz, 16,
// 17, Fizz, 19, Buzz, Fizz, 22, 23, Fizz, Buzz.
//
// FizzBuzz also appears as the first problem in Project Euler,
// where they characterize the problem like this:
//
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we
// get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the
// multiples of 3 or 5 below 1000. Your task is to solve the two versions of the
// FizzBuzz problem, for all numbers up to N; you can use a simple method, but
// it is more fun to be a little bit clever.
//
// Source: https://programmingpraxis.com/2021/03/23/fizzbuzz/

function fizzbuzz(n) {
  let out = []

  // Enumerate the numbers from 1 to N by writing
  for (let i = 1; i <= n; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      // "FizzBuzz" if the number is divisible by both
      out.push("FizzBuzz");
    } else if (i % 3 === 0) {
      // "Fizz" if the number is divisible by 3
      out.push("Fizz");
    } else if (i % 5 === 0) {
      // "Buzz" if the number is divisible by 5
      out.push("Buzz");
    } else {
      //the number itself if the number is divisible by neither
      out.push(i);
    }
  }

  return out;
}

fizzbuzz(25).forEach(x => console.log(x))