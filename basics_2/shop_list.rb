basket = Hash.new

loop do
  puts "Enter name of product:"
  name = gets.chomp
    break if name == "stop"

  puts "Enter unit price:"
  price = gets.chomp.to_i

  puts "Enter amount of products: "
  amount = gets.chomp.to_f

  basket[name] = { price: price, amount: amount }
end

puts "purchase list:"
puts basket

result = 0

basket.each do |name, value|
  all = value[:price] * value[:amount]
  result += all

  puts "Paid for #{name.capitalize} in total #{all} "
end


puts "Total paid: #{result}"
