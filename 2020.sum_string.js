// https://programmingpraxis.com/2020/06/19/summing-a-string/

function sumString(str) {
  return Array
    .from(str.matchAll(/\d+/g))
    .reduce(((m, x) => m + Number(x[0])), 0)
}

console.log(sumString("123abc45def"))