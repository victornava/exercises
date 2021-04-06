# Flatten Hash
#
# Transform a hash into an array where each row represent a value of the hash.
#
# For example, given this hash:

subject = {
  user: {
    jones: {
      friendOf: 'smith',
      group: ['sales', 'service']
    },
    smith: {
      friendOf: 'jones',
      group: ['dev', 'research']
    }
  }
}

# convert it into an array like this:

target = [
  [:user, :jones, :friendOf, "smith"],
  [:user, :jones, :group, ["sales", "service"]],
  [:user, :smith, :friendOf, "jones"],
  [:user, :smith, :group, ["dev", "research"]]
]

# First cut
def flatten_hash(h, memo=[], parent=[])
  h.reduce(memo) do |memo, (k,v)|
    if v.kind_of?(Hash)
      flatten_hash(v, memo, parent + [k])
    else
      memo + [parent + [k, v]]
    end
  end
end

# Translation of python version from
# https://apple.github.io/foundationdb/data-modeling.html#data-modeling-documents
# def to_tuples(item):
#     if type(item) == dict:
#         return [(k,) + sub for k, v in item.iteritems() for sub in to_tuples(v)]
#     else:
#         return [(item,)]
def flatten_hash2(item)
  if item.kind_of?(Hash)
    r = []
    item.each do |k,v|
      flatten_hash2(v).each do |_sub|
        r << ([k] + _sub)
      end
    end
    r
  else
    [[item]]
  end
end

# Point free version of python translation
def flatten_hash3(hash)
  hash.reduce([]) do |m, (k,v)|
    if v.kind_of?(Hash)
      flatten_hash3(v).reduce(m) do |mm, vv|
        mm + [[k] + vv]
      end
    else
      m + [[k, v]]
    end
  end
end

def test(method, input, target)
  output = self.send(method, input)
  puts
  puts method
  puts
  puts "TARGET"
  puts target.map(&:inspect)
  puts
  puts "OUTPUT"
  puts output.map(&:inspect)
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test :flatten_hash , subject, target
test :flatten_hash2, subject, target
test :flatten_hash3, subject, target