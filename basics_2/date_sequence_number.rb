puts "Add day"
day = gets.chomp.to_i
puts "Add month"
month = gets.chomp.to_i
puts "Add year"
year = gets.chomp.to_i

years = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31,
}
#А здесь, видимо, при сохранении нажал кнопку и условие улетело...
if year % 400 == 0 || year % 4 == 0 && year % 100 != 0
  years[2] = 29 
end

date_number = 0
years.each do |months, days|
  date_number += day if months == month #Здесь добавил одну лишнюю букву в "day"
  date_number += days if months < month
end

puts date_number
