print 'enter a: '
 a = gets.to_f
print 'enter b: '
 b = gets.to_f
print 'enter c: '
 c = gets.to_f

d = b**2 - 4 * a * c
puts "Discriminant: #{d}"

  if d < 0
   puts 'The equation has no roots'
   
  elsif d.zero?
   root = -b / (2 * a)
    puts "The only root of equation: #{root}"
	
  else
   double_a = 2 * a
   sqrt_d = Math.sqrt(d)
   root1 = (-b + sqrt_d) / double_a
   root2 = (-b - sqrt_d) / double_a

  puts "The 1st root: #{root1}"
  puts "the 2nd root: #{root2}"
end
