letters = [ 'A', 'E', 'O', 'I', 'U', 'Y',]
hash = Hash.new ()

letters.each do |letter|
  hash[letter] = letter.ord - 64
end

puts hash
