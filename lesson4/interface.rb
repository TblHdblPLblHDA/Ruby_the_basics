class Interface

  def initilaze 
    @all_stations = []
    @all_trains = []
    @all_routes = []
  end

  def start
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
        when 1 then create_new_station
        when 2 then create_new_train
        when 3 then create_new_routes
        when 4 then add_new_stations
        when 5 then route_assign
        when 6 then add_railway_wagon
        when 7 then remove_railway_wagon
        when 8 then move_train
        when 9 then show_list
      end
    end
  end

  private

  def create_new_station # создать новую станцию
    print "Enter station name: "
    name = gets.chomp
    puts "Station - #{name} has been add"
    @all_stations << Station.new(name)
  end
  
  def create_new_train #создать новый поезд
    print "Enter number and type(passenger or cargo) of train"
    number = gets.chomp.to_i
    type = gets.chomp
    if type == 'cargo'
      @all_trains << CargoTrain.new(number)
      puts "train with number - #{number} has been add like cargo train."
    elsif type == 'passenger'
      @all_trains << PassengerTrain.new(number)
      puts "train with number - #{number} has been add like passenger train."
    else
      puts "wrong type"
    end
  end
  
  def create_new_routes # создать новый маршрут
    puts " stations - #{stations.count} "
    @all_stations.each_with_index do 
      |s, i| puts "#{i + 1}. #{s.show_name.capitalize}"
    end
    print "Chose number of the first station: "
    start = gets.chomp.to_i
    print "Chose number of the last station: "
    finish = gets.chomp.to_i
    @all_routes << Route.new(stations[start - 1], stations[finish - 1])
    puts "Route from #{@all_stations[start - 1].show_name.capitalize} to #{@all_stations[finish - 1].show_name.capitalize} has been created!"
  end
  
  def add_new_stations # добавление станции в маршрут
    puts "stations what we have - #{@all_stations.count}"
    @all_stations.each_with_index do 
      |s, i| puts "#{i + 1}. #{s.show_name.capitalize}"
    end
    puts "And routes"
    @all_routes.each_with_index do 
      |r, i| puts "#{i + 1}. Route from #{r.first.show_name.capitalize} to #{r.last.show_name.capitalize}"
    end
    puts "Choose station: "
    answer = gets.chomp.to_i
    puts "Choose route: "
    answer2 = gets.chomp.to_i
    @all_routes[answer2 - 1].add_station(@all_stations[answer - 1]) 
  end
  
  def route_assign # назначение маршрута поезду
    puts "trains - #{@all_trains.count} and #{@all_routes.count} routes."
    puts "Choose the train, to assign the route."
    @all_trains.each_with_index do 
      |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    answer1 = gets.chomp.to_i
    puts "Choose the route."
    @all_routes.each_with_index do 
      |r, i| puts "#{i + 1}. Route from #{r.first.show_name.capitalize} to #{r.last.show_name.capitalize}"
    end
    answer2 = gets.chomp.to_i
    @all_trains[answer1 - 1].take_route (@all_routes[answer2 - 1])
    puts "Route from #{@all_routes[answer2 - 1].first.show_name.capitalize} to #{@all_routes[answer2 - 1].last.show_name.capitalize} has been assign for train number #{trains[answer1 - 1].number.to_s}"
  end

  def add_railway_wagon # добавление вагонов к поезду
    puts "Choose the train to add railway carriage."
    @all_trains.each_with_index do 
      |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    answer = gets.chomp.to_i
      if @all_trains[answer - 1].type == :cargo
        @all_trains[answer - 1].add_railway_wagon(CargoWagonRailway.new)
      elsif @all_trains[answer - 1].type == :passenger
        @all_trains[answer - 1].add_railway_wagon(RailwayWagonPassenger.new)
      end
    puts "Train number #{@all_trains[answer - 1].number} now has #{@all_trains[answer - 1].show_number_of_wagons} railway wagon."
  end
  
  def remove_railway_wagon # отцепка вагонов от поезда
    @all_trains.each_with_index do 
      |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number} with #{t.show_number_of_wagons} railway wagon"
    end
    print "Choose the train to add railway carriage: "
    answer = gets.chomp.to_i
    @all_trains[answer - 1].remove_railway_wagon(@all_trains[answer - 1].number_of_wagons[0])
  end
  
  def move_train # перемещение поезда
    @all_trains.each_with_index do 
      |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    print "Choose the train to move: "
    answer = gets.chomp.to_i
    print "Press 1 to move forward or 2 to move backward:"
    dir = gets.chomp.to_i
    if dir == 1
      @all_trains[answer + 1].move_forward
    elsif dir == 2
      @all_trains[answer - 1].move_back
    end
  end
  
  def show_list # просмотр списка станций и список поездов
    puts 'Station List:'
    puts "\t!!EMPTY!!" if @all_stations.empty?
    @all_stations.each_with_index do 
      |s, i| puts "\t#{i + 1}. #{s.show_name.capitalize}."
    end
    puts ""
    puts 'Trains List:'
    puts "\t!!EMPTY!!" if trains.empty?
    @all_trains.each_with_index do 
      |t, i| puts "\t#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}, location - #{t.current_station.name.to_s}"
    end
  end
end
