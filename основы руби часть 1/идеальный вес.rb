puts "Hey, you! Finally awake, after trying to cross the border. After walking into that Imperial ambush, same as them, and that thief over there. What your name?"
name = gets.chomp
name.capitalize!

puts "Well. i done care who you are. I need to know how much you weigh"

weight = gets.to_i
const = 110

optimal = (weight - const)*1.15

if optimal < 0
puts "#{name} You have perfect weight "
else
puts "#{name} You need #{optimal}kg to optimal weight"
end 