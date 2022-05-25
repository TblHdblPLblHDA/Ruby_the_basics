puts "Введите а"
  a = gets.to_i
puts "Введите b"
  b = gets.to_i
puts "Введите c"
  c = gets.to_i

d = b ** 2 - 4 * a * c
puts "d = b ** 2 - 4 * a * c"

if d<0
  print "Корней нет"
elsif
  x1 = (-b + Math.sqrt(d)) / (2*a)
  x2 = (-b - Math.sqrt(d)) / (2*a)
  puts "x1 = -b + Math.sqrt(d)) / (2*a)
  x2 = -b - Math.sqrt(d)) / (2*a)"

  puts "x1 = -#{b} + Math.sqrt(#{d})) / (2*#{a})
  x2 = -#{b} - Math.sqrt(#{d})) / (2*#{a})"

  puts "x1 = #{x1} , x2 = #{x2} "
else d == 0
  x1 = -b / ( 2 * a )
  print x1
end 
