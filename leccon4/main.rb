require_relative 'station'
require_relative 'route'
require_relative 'trains'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'railway_wagon'
require_relative 'railway_wagon_passenger'
require_relative 'railway_wagon_cargo'

stations = []
trains = []
routes = []

loop do
puts "###############################################"
 
puts "Add - '1' if you want to create new station"  

puts "add - '2' if you want to create new train" 

puts "add - '3' if you want to create new route" 

puts "add - '4' if you want to add station on route" 

puts "add - '5' if you want to assign a route to a train" 

puts "add - '6' if you  want add railway carriages to a train." 

puts "add - '7' if you want unhitch the railway carriages from the train." 

puts "add = '8' if you want move the train forward and backward along the route." 

puts "add = '9' if you want view a list of stations and a list of trains in a station." 

answer = gets.chomp.to_i

case answer
when 1 # создать новую станцию
  print "Enter station name: "
  name = gets.chomp
  puts "Station - #{name} has been add"
  stations << Station.new(name)

when 2 #создать новый поезд
  print "Enter number and type(passenger or cargo) of train"
  number = gets.chomp.to_i
  type = gets.chomp
  if type == 'cargo'
    trains << CargoTrain.new(number)
    puts "train with number - #{number} has been add like cargo train."
  elsif type == 'passenger'
    trains << PassengerTrain.new(number)
    puts "train with number - #{number} has been add like passenger train."
  else
    puts "wrong type"
  end

when 3 # создать новый маршрут
  puts " stations - #{stations.count} "
  stations.each_with_index do |s, i| puts "#{i + 1}. #{s.show_name.capitalize}"
  end
  print "Chose number of the first station: "
  start = gets.chomp.to_i
  print "Chose number of the last station: "
  finish = gets.chomp.to_i
  routes << Route.new(stations[start - 1], stations[finish - 1])
  puts "Route from #{stations[start - 1].show_name.capitalize} to #{stations[finish - 1].show_name.capitalize} has been created!"

when 4 # добавление станции в маршрут
  puts "stations what we have - #{stations.count}"
  stations.each_with_index do |s, i| puts "#{i + 1}. #{s.show_name.capitalize}"
  end
  puts "And routes"
  routes.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_name.capitalize} to #{r.last.show_name.capitalize}"
  end
  puts "Choose station: "
  answer = gets.chomp.to_i
  puts "Choose route: "
  answer2 = gets.chomp.to_i
  routes[answer2 - 1].add_station(stations[answer - 1]) 

when 5 # назначение маршрута поезду
  puts "trains - #{trains.count} and #{routes.count} routes."
  puts "Choose the train, to assign the route."
  trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
  end
  answer1 = gets.chomp.to_i
  puts "Choose the route."
  routes.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_name.capitalize} to #{r.last.show_name.capitalize}"
  end
  answer2 = gets.chomp.to_i
  trains[answer1 - 1].take_route (routes[answer2 - 1])
  puts "Route from #{routes[answer2 - 1].first.show_name.capitalize} to #{routes[answer2 - 1].last.show_name.capitalize} has been assign for train number #{trains[answer1 - 1].number.to_s}"

when 6 # добавление вагонов к поезду
  puts "Choose the train to add railway carriage."
  trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
  end
  answer = gets.chomp.to_i
    if trains[answer - 1].type == :cargo
      trains[answer - 1].add_railway_wagon(CargoWagonRailway.new)
    elsif trains[answer - 1].type == :passenger
      trains[answer - 1].add_railway_wagon(RailwayWagonPassenger.new)
    end
  puts "Train number #{trains[answer - 1].number} now has #{trains[answer - 1].show_number_of_wagons} railway wagon."

when 7 # отцепка вагонов от поезда
  trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number} with #{t.show_number_of_wagons} railway wagon"
  end
  print "Choose the train to add railway carriage: "
  answer = gets.chomp.to_i
  trains[answer - 1].remove_railway_wagon(trains[answer - 1].number_of_wagons[0])

when 8 # перемещение поезда
  trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
  end
  print "Choose the train to move: "
  answer = gets.chomp.to_i
  print "Press 1 to move forward or 2 to move backward:"
  dir = gets.chomp.to_i
  if dir == 1
    trains[answer + 1].move_forward
  elsif dir == 2
    trains[answer - 1].move_back
  end

when 9 # просмотр списка станций и список поездов
  puts 'Station List:'
  puts "\t!!EMPTY!!" if stations.empty?
  stations.each_with_index do |s, i| puts "\t#{i + 1}. #{s.show_name.capitalize}."
  end
  puts ""
  puts 'Trains List:'
  puts "\t!!EMPTY!!" if trains.empty?
  trains.each_with_index do |t, i| puts "\t#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}, location - #{t.current_station.name.to_s}"
  end
end
end