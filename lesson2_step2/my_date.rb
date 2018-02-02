print "input year: "
year = gets.to_i
print ("input day")
day = gets.to_i
print ("input month")
month = gets.to_i

year_init = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
year_init[1] = 29 if (year % 4 == 0 && year % 100 !=0) || year % 400 == 0

my_year = year_init.first(month - 1)
my_date = day + my_year.inject(0) { |sum, date| sum + date }


puts my_date
