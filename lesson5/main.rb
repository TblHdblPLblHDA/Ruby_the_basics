require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'railway_wagon'
require_relative 'railway_wagon_passenger'
require_relative 'railway_wagon_cargo'

stations = []
trains = []
routes = []

loop do
 
puts "Add - '1' if you want to create new station"  

puts "add - '2' if you want to create new train" 

puts "add - '3' if you want to create new route" 

puts "add - '4' if you want to delete route" 

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
end

when 2 #создать новый поезд
  print "Enter number and type(passenger or cargo) of train"
  number = gets.chomp.to_i
  type = gets.chomp
  if type == 'cargo'
    trains << CargoTrain.new(number)
    puts "train with number - #{number} has been add like cargo train."
  elsif type == 'passenger'
    trains << PassengerTrain(number)
    puts "train with number - #{number} has been add like passenger train."
  else
    puts "wrong type"
  end
end

when 3 # создать новый маршрут
  puts "We have #{stations.count} stations."
  stations.each_with_index do |s, i| puts "#{i + 1}. #{s.show_title.capitalize}"
  end
  print "Chose number of the first station: "
  start = gets.chomp.to_i
  print "Chose number of the last station: "
  finish = gets.chomp.to_i
  routes << Route.new(stations[start - 1], stations[finish - 1])
  puts "Route from #{stations[start - 1].show_title.capitalize} to #{stations[finish - 1].show_title.capitalize} has been created!"
end

when 4 # добавление станции в маршрут
  puts "We have #{stations.count} stations."
  stations.each_with_index do |s, i| puts "#{i + 1}. #{s.show_title.capitalize}"
  end
  puts "And we have routes"
  routes.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_title.capitalize} to #{r.last.show_title.capitalize}"
  end
  puts "Choose station: "
  answer = gets.chomp.to_i
  puts "Choose route: "
  answer2 = gets.chomp.to_i
  routes[answer2 - 1].add_station(stations[answer - 1]) 
end

when 5 # назначение маршрута поезду
  puts "We have #{trains.count} trains and #{routes.count} routes."
  puts "Choose the train, to assign the route."
  trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
  end
  answer1 = gets.chomp.to_i
  puts "Choose the route."
  routes.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_title.capitalize} to #{r.last.show_title.capitalize}"
  end
  answer2 = gets.chomp.to_i
  trains[answer1 - 1].add_to_route(routes[answer2 - 1])
  puts "Route from #{routes[answer2 - 1].first.show_title.capitalize} to #{routes[answer2 - 1].last.show_title.capitalize} has been assign for train number #{trains[answer1 - 1].number.to_s}"
end

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
  puts "Train number #{trains[answer - 1].number} now has #{trains[answer - 1].show_number_of_wagons} railway carriages."
end

when 7 # отцепка вагонов от поезда
  trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number} with #{t.show_number_of_wagons} railway carriages"
  end
  print "Choose the train to add railway carriage: "
  answer = gets.chomp.to_i
  trains[answer - 1].remove_railway_wagon(trains[answer - 1].number_of_wagons[0])
end

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
end

when 9 # просмотр списка станций и список поездов
  puts '##################################'
  puts '######### Station List ###########'
  puts "\t!!EMPTY!!" if stations.empty?
  stations.each_with_index do |s, i| puts "\t#{i + 1}. #{s.show_title.capitalize}."
  end
  puts '##################################'
  puts '######### Trains List ############'
  puts "\t!!EMPTY!!" if trains.empty?
  trains.each_with_index do |t, i| puts "\t#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}, location - #{t.current_station.title.to_s}"
  end
end
