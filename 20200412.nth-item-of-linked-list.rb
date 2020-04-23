# Nth Item In A Linked List
#
# from: https://programmingpraxis.com/2020/04/10/nth-item-in-a-linked-list/
#
# Your task is to write a program to find the nth item in a linked list; your
# program must be recursive, as was required by the original assignment. When
# you are finished, you are welcome to read or run a suggested solution, or to
# post your own solution or discuss the exercise in the comments below.

Node = Struct.new(:value, :next_node)

def make_list(values)
  prev = nil
  values.map do |value|
    if prev == nil
      prev = Node.new(value)
    else
      prev.next_node = Node.new(value)
      prev = prev.next_node
    end
  end.first
end

def nth_item_of_list(n, list, i=0)
  return nil if n < 0
  return list.value if n == i
  return nil if list.next_node == nil
  nth_item_of_list(n, list.next_node, i+1)
end

list = make_list(["a", "b", "c"])

puts nth_item_of_list(-1, list) == nil
puts nth_item_of_list(0, list) == 'a'
puts nth_item_of_list(1, list) == 'b'
puts nth_item_of_list(2, list) == 'c'
puts nth_item_of_list(3, list) == nil