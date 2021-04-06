// Bigger to the right
//
// Given a list of integers, calculate a list of integers that contains, at each
// item of the list, the count of integers in the original list that are greater
// than the item at the current position of the original list. For example,
// given the input list (10 12 8 17 3 24 19), the desired output is (4 3 3 2 2 0
// 0), because at the first item in list, 10, there are four items (12 17 24 19)
// greater than 10, at the second item in the list, 12, there are three items
// (17 24 19) greater than 12, at the third item in the list, 8, there are three
// items (17 24 19) greater than 8, at the fourth item in the list, 17, there
// are two items (24 19) greater than 17, at the fifth item in the list, 3,
// there are two items (24 19) greater than 3, at the sixth item in the list,
// 24, there are 0 items () greater than 24, and at the seventh item in the
// list, 19, there are 0 items greater than 19.
//
// Your task is to write a program to calculate the list of counts of greater
// than the current item; is there an O(n) solution?
//
// Source: https://programmingpraxis.com/2021/03/09/bigger-to-the-right/

function bttr1(arr) {
  return arr.map((x, i) => arr.slice(i).filter(y => y > x).length)
}

function bttr2(arr) {
  let out = [];
  for (var i = 0; i < arr.length; i++) {
    let count = 0;
    for (var j = i; j < arr.length; j++) {
      if (arr[j] > arr[i]) count++;
    }
    out.push(count);
  }
  return out;
}

function test(target, subject) {
  console.log(target.toString() == subject.toString() ? "✅" : "❌");
}


const input = [10, 12, 8, 17, 3, 24, 19]
const target = [4, 3, 3, 2, 2, 0, 0]

test(target, bttr1(input))
test(target, bttr2(input))

