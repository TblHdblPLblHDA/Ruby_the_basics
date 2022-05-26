puts " Enter 1st side "
  a = gets.to_i
puts " Enter 2nd side "
  b = gets.to_i
puts " Enter 3d side "
  c = gets.to_i
 
if c > b && c > a 
  hypotenuse = c
elsif b > c && b > a 
  hypotenuse  = b
else 
  hypotenuse = a
end

if hypotenuse**2 = a**2 + b**2 || hypotenuse**2 = b**2 + c**2 || hypotenuse**2 = a**2 + c**2 
  puts "triangle rectangular"
elsif a == b && b == c && a == c
  print "triangle equilateral and isosceles"
elsif  (a == b || a == c || b == c) && (a != b || b != c || a != c) 
  puts "triangle isosceles"
else
  print "another isosceles"
end
