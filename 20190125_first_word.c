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

#include <stdio.h>
#include <string.h>

int main() {
  char string[] = "abcdefg hijklmnop qrs tuv wxyz";
  char word[100];
  int i;

  for (i = 0; i < strlen(string); i++) {
    if (string[i] == ' ')
      break;
    word[strlen(word)] = string[i];
  }

  printf("%s", word);
  return 0;
}