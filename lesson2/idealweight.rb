print "Hello! Please, enter your name?"
name = gets.chomp

print "Please, enter your growth? "
growth = gets.to_i

print "Please, enter your weight? "
weight = gets.to_i

ideal_weight = growth-110

if 
  ideal_weight >0
    puts "#{name}, your ideal weight is #{ideal_weight} "

else
  ideal_weight <0
    puts "#{name}, you need to eat unless=("
  
  end