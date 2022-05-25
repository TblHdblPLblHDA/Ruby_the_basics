puts "enter а"
  a = gets.to_i
puts "enter b"
  b = gets.to_i
puts "enter c"
  c = gets.to_i

d = b**2 - 4 * a * c
puts "d = b**2 - 4 * a * c"

if d < 0
  print "There are no roots"
elsif
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "x1 = -b + Math.sqrt(d)) / (2 * a)
  x2 = -b - Math.sqrt(d)) / (2 * a)"

  puts "x1 = (-#{b} + Math.sqrt(#{d})) / (2 * #{a})
  x2 = (-#{b} - Math.sqrt(#{d})) / (2 * #{a}) "

  puts "x1 = #{x1} , x2 = #{x2} "
else d == 0
  x1 = -b / ( 2 * a )
  print x1
end 
