# Base64 encoder/decoder

A basic Base64 encoder/decoder. Just to understand how things work. Mkay?

There are two function:

    base_64_encode(str) → base64str
    base_64_decode(base64str) → str

Ref: https://www.rfc-editor.org/rfc/rfc4648

# Usage

To encode a file like an image:

    ruby base64.rb encode test.jpg > out.txt

To decode a base64 encoded file:

    ruby base64.rb decode text.txt > out.jpg

To run the tests:

    ruby base64.rb decode text.txt
