=begin

Python Challenge #4
http://www.pythonchallenge.com/pc/def/linkedlist.php

Hint:

  follow the chain
  urllib may help
  DON'T TRY ALL NOTHINGS, since it will neverend
  400 times is more than enough

  <a href="linkedlist.php?nothing=12345"><img src="chainsaw.jpg" border="0"/></a>

Clickin on the link:

    http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=12345

Leads to a page with another `nothing`:

  and the next nothing is 44827

Then trying:

  http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=44827

Leads to:

  and the next nothing is 45439

So it seems like we need to follow the links at least 400 links.

=end

require 'net/http'


base_url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="
# nothing  = "12345"
# nothing  = "8022"
nothing  = "37278"


400.times do
  puts "---"
  url = base_url+nothing
  puts "Get: #{url}"
  response = Net::HTTP.get(URI(url))
  puts "Reponse: #{response}"
  maybe_ = response[/\d+/]
  raise "🔥" unless response[/\d+/]
  nothing = response[/\d+/]
end

=begin

Did 88 request and got stuck at the last one:

http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=16044

The response was:

> Yes. Divide by two and keep going.

Let's try dividing the last nothing by 2.

Last nothing was 16044 new nothing is 8022:

http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=8022

Response

> and the next nothing is 25357

http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=25357

Got a few more but got stuck here:

---
Get: http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=82682
Reponse: There maybe misleading numbers in the 
text. One example is 82683. Look only for the next nothing and the next nothing is 63579
---
Get: http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=82683
Reponse: You've been misleaded to here. Go to previous 
one and check.

Let's try 63579:

> and the next nothing is 37278

Cool. Let's resume from 37278

Got to:

---
Get: http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=66831
Reponse: peak.html

http://www.pythonchallenge.com/pc/def/peak.html

Bingo.

=end
