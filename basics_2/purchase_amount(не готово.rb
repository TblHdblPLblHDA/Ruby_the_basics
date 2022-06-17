shopping = {}

puts "What would you want to buy?"
puts shopping
puts "-- Type 'add' to add a food"
#puts "-- Type 'change' to change quantity your purchases"
puts "-- Type 'basket'  to view what you bought"

choise = gets.chomp.downcase
case choise
when "add"
  loop do
    puts "What would you want to buy? If you want to stop shopping, enter 'stop'"
    puts "add name of product"
    product = gets.chomp
    break if product == "stop"

    puts "add unit price"
    price = gets.cmomp.to_i

    puts "add amount of products"
    amount = gets.chomp.to_f

    shopping[product] = { price: price, amoont: amount }
  end
end
#when "change"
basket = 0
when "basket"
  shopping.each do |name, value|
    sum = value [:price] * value [:amount]
    basket += sum
    puts "In Basket: #{name} on the cost #{sum}"
    puts "Total paid: #{basket}"
  end
end


