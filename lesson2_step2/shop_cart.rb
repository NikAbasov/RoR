shop = {}
name = ""
price = ""
quantity = ""
total = 0

puts "Введите название товара или stop для завершения заполнения: "
name = gets.chomp

while name != "stop"
  puts "Введите цену за единицу товара: "
  price = gets.chomp.to_f
  
  puts "Введите количество купленного товара: "
  quantity = gets.chomp.to_f
  
  shop[name] = { price: price, count: quantity }
  
  puts "Введите название товара: "
  name = gets.chomp
end

shop.each do |k, v|
  price = v[:price] * v[:count]
  total += price 
  
  puts "Название товара - #{k} и цена - #{price}"
end

puts "Итоговая сумма всех покупок - #{total}"
