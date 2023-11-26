'''
Python Challenge #6
http://www.pythonchallenge.com/pc/def/zip.html

The first url says:

> yes. find the zip. 

We need to find a zip file. There is one here:

http://www.pythonchallenge.com/pc/def/channel.zip

Unzipping that, there is a directory with 911 files that looks like this:

    ├── 100.txt
    ├── 10134.txt
    ├── 1035.txt
    .
    .
    .
    ├── 99775.txt
    ├── 99905.txt
    └── readme.txt

In the readme file:

> welcome to my zipped list.
> 
> hint1: start from 90052
> hint2: answer is inside the zip
  
In file 90052.txt:

> Next nothing is 94191

In file 94191.txt:

> Next nothing is 85503

So like in the linkedlist exercice we need to follow the listfrom nothing to
nothing. This time the linked thing is a file. So we just append a `.txt` extention at the nothing and open that file.

85503 → 85503.txt

However we can just cat all files at once and see that's going on:

7422.txt → Next nothing is 30983
19944.txt → Next nothing is 25547
12187.txt → Next nothing is 45084
88244.txt → Next nothing is 91669
14723.txt → Next nothing is 60832

All files contain `Next nothing is $NUMBER` except 46145.txt which has a hint:

> Collect the comments.

What does that mean?

It could mean read the readme.

It could mean collect the comments in the files. Maybe collect means something
in python? It doesn't seem like.

It could mean print the comments as they appear. Or follow the linked files
printing their content

It seems to mean: read the comments in the zipfile. Apparently you can put
comments in zip a file ¯\_(ツ)_/¯

Apparently some of exercises are meant to showcase some python feature, hence the
name pythonchallenge.

This problem requires reading comments of a zip file. Ruby can't do that
without external dependencies. So let's try Python.
'''

import re
import zipfile

names = []
name = "90052"

# Read the files starting from 90052. Put the name in an `names`.
# This give us the order of things
while True:
  names.append(name)  
  file_name = "6/" + name + ".txt"
  contents = open(file_name, 'r').read()
  print(contents)
  matches = re.findall("\d+", contents) 
  if len(matches) == 0:
    break
  name = matches[0]

# Read comments of each entry in zipfile as they appear in `names`
out = ""
z = zipfile.ZipFile('6.zip', 'r')

for name in names:
  item = (name + ".txt")
  out += z.getinfo(item).comment.decode('ascii')

print(out)

'''
Output:
****************************************************************
****************************************************************
**                                                            **
**   OO    OO    XX      YYYY    GG    GG  EEEEEE NN      NN  **
**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE  NN    NN   **
**   OO    OO XXX  XXX YYY   YY  GG GG     EE       NN  NN    **
**   OOOOOOOO XX    XX YY        GGG       EEEEE     NNNN     **
**   OOOOOOOO XX    XX YY        GGG       EEEEE      NN      **
**   OO    OO XXX  XXX YYY   YY  GG GG     EE         NN      **
**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE     NN      **
**   OO    OO    XX      YYYY    GG    GG  EEEEEE     NN      **
**                                                            **
****************************************************************
**************************************************************

Bingo!

http://www.pythonchallenge.com/pc/def/hockey.html
'''