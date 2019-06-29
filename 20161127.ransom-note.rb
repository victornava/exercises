# This is the an anwer to the first question in programming praxis exercice:
#
# https://programmingpraxis.com/2016/11/25/three-amazon-interview-questions/
#
# Three Amazon Interview Questions
#
# 1) A kidnapper wants to write a ransom note by cutting characters from the text of
# a magazine. Given two strings containing the characters of the ransom note and
# the characters of the magazine, write a program to determine if the ransom note
# can be formed from the magazine.

@ransom_note = "whatever happens happens"
@magazine1 = "whatever happens happens"
@magazine2 = "whatever happens doesnt"
@magazine3 = "Lorem happens what ipsum dolor happ sit ever ametens"


def can_write?(ransom_note, magazine)
  note = @ransom_note.gsub(/\s/, '').chars
  mag = magazine.gsub(/\s/, '').chars
  note.each do |char|
    found_at = mag.index(char)
    if found_at
      mag.delete_at(found_at) # MUTATION!
    else
      return false
    end
  end
  true
end

def can_write_recursive?(ransom_note, magazine)
  _can_write_recursive(
    @ransom_note.gsub(/\s/, '').chars,
    magazine.gsub(/\s/, '').chars)
end

def _can_write_recursive(note, mag)  
  if note.empty?
    true
  else
    note_head, *note_rest = note
    found_at = mag.index(note_head)
    if found_at
      mag.delete_at(found_at) # MUTATION!
      _can_write_recursive(note_rest, mag)
    else
      false
    end
  end
end

def test(code)
  "#{code} -> #{eval(code)}"
end


puts <<-TEST

@ransom_note = #{@ransom_note}
@magazine1 = #{@magazine1}
@magazine2 = #{@magazine2}
@magazine3 = #{@magazine3}

#{test 'can_write?(@ransom_note, @magazine1)'}
#{test 'can_write?(@ransom_note, @magazine2)'}
#{test 'can_write?(@ransom_note, @magazine3)'}
#{test 'can_write_recursive?(@ransom_note, @magazine1)'}
#{test 'can_write_recursive?(@ransom_note, @magazine2)'}
#{test 'can_write_recursive?(@ransom_note, @magazine3)'}

TEST