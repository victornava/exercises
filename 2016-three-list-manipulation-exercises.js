/**

https://programmingpraxis.com/2016/10/11/three-list-manipulation-exercises

Three List Manipulation Exercises

Task 1
Write a function that takes a linked list of integers and returns a new linked
list with all the odd integers removed.

Task 2
Write a function that removes every nth item from a linked list.

Task 3
Write a function that reverses the two halves of a list; if the number of items
in the list is odd, the middle element should go with the second half of the li

**/

function dropOdds(list) {
  return list.filter((n) => n % 2 == 0);
}

function removeEveryNthItem(n, list) {
  return list.filter((o,i) => (i+1) % n != 0);
}

function reverseTwoHalves(list) {
  const l = list.length;
  return list.slice(l/2, l).concat(list.slice(0, l/2));
}

// Test Code
function equal(arr1, arr2) {
  // https://github.com/component/array-equal/blob/master/index.js
  var length = arr1.length
  if (length !== arr2.length) return false
  for (var i = 0; i < length; i++)
    if (arr1[i] !== arr2[i])
      return false
  return true
}

function test(output, target) {
  console.log("target: " + target);
  console.log("output: " + output);
  console.log(equal(target, output) ? "PASS" : "FAIL");
  console.log();
}

const oneToTwenty = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
const oneToTen    = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
const oneToNine   = [1, 2, 3, 4, 5, 6, 7, 8, 9]

test(dropOdds(oneToTwenty), [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]);
test(removeEveryNthItem(3, oneToTwenty), [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20]);
test(reverseTwoHalves(oneToTen), [6, 7, 8, 9, 10, 1, 2, 3, 4, 5]);
test(reverseTwoHalves(oneToNine), [5, 6, 7, 8, 9, 1, 2, 3, 4])