puts "Please, enter triangle side a"
 a = gets.chomp.to_f
puts "Please, enter triangle side b"
 b = gets.chomp.to_f
puts "Please, enter triangle side c"
 c = gets.chomp.to_f

if a == b && b == c
 return
end
 
array = [a, b, c]
hypotenuse = array.max
array.delete(hypotenuse)
right_triangle = (hypotenuse**2 == array.first**2 + array.last**2)

if  right_triangle && array.first == array.last
  puts 'Your triangle is rectangular and isosceles'
  
elsif right_triangle
  puts 'Your triangle is rectangular'
  
else
  puts 'Your triangle is not rectangular'
  
end
