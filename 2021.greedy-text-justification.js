// 2021-04-05
//
// Greedy Text Justification by programmingpraxis
//
// Today's exercise would make a good interview question, though I don't know of
// anyone doing that; you should answer as if you are standing at a whiteboard
// explaining your code as you go:
//
// Given a string and a line width, split the string into words (a maximal run
// of characters excluding spaces) and write the words onto successive lines
// with spaces added between the words so that each line is the requested width.
// Words should be added to lines greedily (as many words as will fit) and extra
// spaces should be assigned to the left of the output string. The last line
// should not have spaces added, so it may be shorter than the other lines.
//
// For example, the string "This is an example of text justification" is written
// with a line width of 16 like this:
//
//     ----+----+----+-
//     This    is    an
//     example  of text
//     justification.
//     ----+----+----+-
//
// Your task is to write a program that greedily justifies text.
//
// Source: https://programmingpraxis.com/2021/03/30/greedy-text-justification/

const sep = " ";

function justify(str, width) {
  if (sep.length != 1) {
    throw "ERROR: sep must be one char long."
  }

  let buf = []
  let lines = []
  const words = str.split(/\s+/)

  words.forEach(word => {
    // Does word fits in buf?
    const wordFitsInLine = buf.concat([word]).join(sep).length <= width

    if (wordFitsInLine) {
      buf.push(word)
    } else {
      lines.push(makeLine(buf, width))
      buf = [word]
    }
  })

  lines.push(makeLine(buf, width))

  return lines.join("\n")
}

function makeLine(words, width) {
  if (words.length == 0) {
    return ""
  }

  if (words.length == 1) {
    return words[0]
  }

  const wordsInit = words.slice(0, words.length-1)
  const wordsLast = words[words.length-1]
  let pads = (new Array(words.length-1)).fill(sep)

  while (true) {
    for (let i = 0; i < pads.length; i++) {
      pads[i] = pads[i] + sep

      line = wordsInit
        .flatMap((w, j) => [w, pads[j]])
        .concat([wordsLast])
        .join('')

      if (line.length == width) {
        return line
      }
    }
  }
}
const s1 = "This is an example of text justification."
const s2 = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

console.log(justify(s1, 16))
console.log("---")
console.log(justify(s2, 40))
