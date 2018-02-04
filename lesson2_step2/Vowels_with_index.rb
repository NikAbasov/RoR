alphabet = "a".."z"

vowels = [ "a", "e", "i", "o", "u" ]

hash_xyz = {}

alphabet.each_with_index { |char, index| hash_xyz[index + 1] = char if vowels.include?(char) }

puts hash_xyz