# Base64 encoder/decoder
# ref: https://www.rfc-editor.org/rfc/rfc4648#section-4

# mapping[value] -> encoding
MAPPING = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

def base64_encode(input)
  out = ""
  carry = ""

  input.bytes.each do |byte|
    b_str = sprintf('%08b', byte) # Convert byte to binary string
    i = 6 - carry.size
    value = (carry + b_str[0...i]).to_i(2)
    carry = b_str[i...8]
    out << MAPPING[value]

    if carry.size == 6
      value = carry.to_i(2)
      out << MAPPING[value]
      carry = ""
    end
  end

  if !carry.empty?
    right_pad = "0" * (6 - carry.size)
    value = (carry + right_pad).to_i(2)
    out << MAPPING[value]
  end

  if out.size % 4 != 0
    out << "=" * (4 - out.size % 4)
  end

  out
end

def base64_decode(input)
  bytes = []
  buffer = ""
  input.chars.each_with_index do |char, char_i|
    value = MAPPING.index(char)
    if value
      bits = sprintf('%06b', value)
      if buffer.empty?
        buffer = bits
      else
        i = 8 - buffer.size
        buffer << bits[0...i]
        bytes << buffer.to_i(2)
        buffer = bits[i...6]
      end
    elsif char == '='
      next_char = input.chars[char_i+1]
      if next_char && next_char != '='
        raise "Misplaced char '=' at #{char_i}"
      end
    else
      raise "Invalid char '#{char}' at #{char_i}"
    end
  end

  bytes.pack("C*")
end

# Tests
def test
  puts "Test: encode"
  puts
  t base64_encode(""), ""
  t base64_encode("f"), "Zg=="
  t base64_encode("fo"), "Zm8="
  t base64_encode("foo"), "Zm9v"
  t base64_encode("foob"), "Zm9vYg=="
  t base64_encode("fooba"), "Zm9vYmE="
  t base64_encode("foobar"), "Zm9vYmFy"
  t base64_encode(File.binread('test.jpg')), File.binread('test.txt')
  puts
  puts "Test: decode"
  t base64_decode(""), ""
  t base64_decode("Zg=="), "f"
  t base64_decode("Zm8="), "fo"
  t base64_decode("Zm9v"), "foo"
  t base64_decode("Zm9vYg=="), "foob"
  t base64_decode("Zm9vYmE="), "fooba"
  t base64_decode("Zm9vYmFy"), "foobar"
  puts base64_decode(File.binread('test.txt')) == File.binread('test.jpg')
  t (begin; base64_decode("Zm9vYmF=y"); rescue Exception => e; e.message; end), "Misplaced char '=' at 7"
  t (begin; base64_decode("Zm9vYmF==y"); rescue Exception => e; e.message; end), "Misplaced char '=' at 8"
  t (begin; base64_decode("Z@m9vYmFy"); rescue Exception => e; e.message; end), "Invalid char '@' at 1"
end

def t(a, b)
  puts "----------------", a[0..80], b[0..80], a == b ? "✅" : "❌"
end

# CLI
command = ARGV[0]
file = ARGV[1]

case command
when 'encode'
  print base64_encode(File.read(file))
when 'decode'
  print base64_decode(File.read(file))
when 'test'
  test
else
  puts <<~USAGE
😅 Need an argument to work. Your options are:
  encode <file>
  decode <file>
  test
USAGE
end
