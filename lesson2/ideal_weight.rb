print "Hello! Please, enter your name?"
name = gets.chomp

print "Please, enter your growth? "
growth = gets.chomp.to_i

print "Please, enter your weight? "
weight = gets.chomp.to_i

ideal_weight = growth - 110

 if  ideal_weight > 0
    puts "#{name}, your ideal weight is #{ideal_weight} "

 elsif  ideal_weight < 0
    puts "#{name}, you need to eat unless=("
  
 end
