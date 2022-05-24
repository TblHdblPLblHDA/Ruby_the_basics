puts "Введите катет1"
katet1 = gets.to_i
puts "Введите катет2"
katet2 = gets.to_i
puts " Введите гипотенузу "
hypotenuse = gets.to_i

if hypotenuse**2 == katet1**2+katet2**2
puts " Треугольник равнобедренный "

elsif katet1 == katet2 && katet2 == hypotenuse && katet1 == hypotenuse
print " треугольник равносторонний и равнобедренный "
else
puts " треугольник не равносторонний и не равнобедренный "
end
