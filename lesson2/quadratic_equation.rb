puts 'enter a: '
 a = gets.chomp.to_f
puts 'enter b: '
 b = gets.chomp.to_f
puts 'enter c: '
 c = gets.chomp.to_f

d = b**2 - 4 * a * c
puts "Discriminant: #{d}"

if d < 0
   puts 'The equation has no roots'
   
elsif d.zero?
   root = -b / (2 * a)
    puts "The only root of equation: #{root}"
	
else   
   sqrt_d = Math.sqrt(d)
   root1 = (-b + sqrt_d) / double_a
   root2 = (-b - sqrt_d) / double_a

  puts "The 1st root: #{root1}"
  puts "the 2nd root: #{root2}"
end
