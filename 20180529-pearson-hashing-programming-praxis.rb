# source: https://programmingpraxis.com/2018/05/25/pearson-hashing/2/

# Pearson Hashing
#
# Cryptographic hashes, also called message digests, are ubiquitous in modern
# cryptography — Brce Schneier calls them “the workhorses of modern
# cryptography” — used among other things in digital signatures, message
# authentication codes, as fingerprints to detect duplicate data, and as
# checksums to detect data corruption. Today we look at a simple example of a
# hash function, not suitable for cryptography, but useful for non-cryptographic
# purposes.
#
# Peter Pearson describes a hash function based on a permutation table Tof the
# numbers 0 inclusive to 256 exclusive. Starting from an initial hash of 0, each
# byte of the message is accessed in order, added to the current hash mod 256,
# then the hash is replaced by the value in the permutation table corresponding
# to that sum. In some implementations, including Pearson’s original, the two
# bytes are XOR’ed rather than added mod 256.
#
# If eight bits isn’t enough, Pearson gives a simple algorithm for extending
# the algorithm to sixteen bits. First, compute the normal 8-bit hash. Then, add
# 1 (mod 256) to the first character of the string, and compute the normal 8-bit
# hash of the modified string; since a modification to a single bit provides a
# large change in the hash value, the two hashes will be independent of each
# other. Finally, concatenate the two hashes. Pearson doesn’t mention it, but
# this scheme can be extended to any multiple of eight bits.
#
# Your task is to write a program that computes the 8-bit and 16-bit Pearson
# hashes of an input string, given a suitable permutation table. When you are
# finished, you are welcome to read or run a suggested solution, or to post your
# own solution or discuss the exercise in the comments below.

def pearson_hash(message, table, size_in_bytes)
  msg = message.clone
  size_in_bytes.times.reduce("") do |memo, i|
    hash = 0
    msg[0] = ((msg[0].ord + i) % 256).chr
    msg.chars do |char|
      hash = table[(hash + char.ord) % 256]
      # puts "message: #{message} hash: #{hash}" 
    end
    memo += hash.to_s
  end
end


# use `(0..255).to_a.shuffle` to generate a new one
table = [
  68, 6, 218, 45, 29, 132, 105, 22, 192, 155, 146, 66, 226, 231, 123, 25, 212,
  64, 156, 52, 71, 220, 77, 194, 178, 36, 34, 153, 181, 130, 99, 39, 108, 215,
  92, 119, 55, 216, 175, 72, 168, 169, 136, 185, 57, 53, 1, 233, 125, 237, 78,
  184, 48, 61, 201, 161, 60, 217, 124, 173, 32, 15, 176, 172, 70, 9, 129, 100,
  43, 142, 222, 207, 158, 189, 206, 82, 163, 44, 2, 17, 177, 20, 102, 174, 190,
  126, 122, 109, 144, 252, 58, 121, 160, 127, 46, 221, 73, 112, 250, 4, 38, 18,
  135, 209, 133, 69, 63, 152, 151, 115, 191, 110, 243, 230, 85, 167, 148, 246,
  203, 74, 128, 238, 150, 204, 79, 81, 84, 180, 154, 104, 199, 208, 164, 182,
  30, 143, 14, 241, 80, 42, 223, 249, 219, 3, 227, 239, 254, 186, 171, 232,
  145, 98, 107, 157, 106, 75, 51, 251, 228, 26, 200, 89, 183, 83, 193, 210,
  255, 67, 37, 211, 111, 59, 7, 35, 101, 47, 236, 234, 224, 137, 138, 159, 5,
  134, 91, 13, 118, 139, 165, 240, 56, 149, 49, 33, 23, 86, 116, 179, 96, 16,
  27, 21, 88, 93, 87, 90, 19, 54, 113, 50, 28, 120, 202, 62, 188, 245, 198,
  195, 117, 94, 24, 170, 205, 244, 141, 0, 225, 103, 95, 214, 229, 11, 65, 97,
  31, 248, 76, 114, 147, 41, 242, 196, 197, 235, 12, 247, 253, 140, 8, 10, 40,
  162, 131, 213, 166, 187
]

puts pearson_hash('Hola', table, 1)
puts pearson_hash('Programming Praxis', table, 1)
puts pearson_hash('Programming Praxis', table, 4)
