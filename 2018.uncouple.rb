# source: https://programmingpraxis.com/2018/06/15/uncouple
#
# Uncouple
#
# A couple is two adjacent identical items in a sequence. You are to remove all
# couples, then process the list recursively to remove any additional couples
# formed by the removal of the original couples. For instance, given the list
# {red blue green green blue red yellow}, first remove the green couple, leaving
# {red blue blue red yellow}, then remove the blue couple, leaving {red red
# yellow}, and finally remove the red couple, leaving {yellow}.

def uncouple(list)
  out = []
  duped = false

  (0...list.size).each do |i|
    if list[i] == list[i+1]
      duped = true
    elsif duped
      duped = false
    else
      out << list[i]
    end
  end

  out.size == list.size ? out : uncouple(out)
end

puts uncouple(%w(red blue green green green blue red yellow pink pink)) == ['yellow']
