shop = {}
shop_name = ""
shop_price = ""
shop_quantity = ""
price_total = 0

puts "Введите название товара или stop для завершения заполнения: "
shop_name = gets.chomp

while shop_name != "stop"
  puts "Введите цену за единицу товара: "
  shop_price = gets.chomp.to_f
  
  puts "Введите количество купленного товара: "
  shop_quantity = gets.chomp.to_f
  
  shop[shop_name] = { price: shop_price, count: shop_quantity }
  
  puts "Введите название товара: "
  shop_name = gets.chomp
end

shop.each do |k, v|
  local_price = v[:price] * v[:count]
  price_total += local_price 
  
  puts "Название товара - #{k} и цена - #{local_price}"
end

puts "Итоговая сумма всех покупок - #{price_total}"
