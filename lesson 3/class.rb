class Station
  def initialize(name) #Имеет название, которое указывается при ее создании
    @name = name
    @trains = []
  end

  def add_train(train) #Может принимать поезда (по одному за раз)
    return if @trains.include?(train)
    @trains << train # Пропустил букву s
  end

  def train_list #Может возвращать список всех поездов на станции, находящиеся в текущий момент
    @trains
  end

  def train_list_type(type) #Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
    @trains.select do |train| #Стояла класс train, Хотя должен был быть trains. 
      train.type == type
    end
  end

  def delete_train(train) #Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
    @trains.delete(train)
  end

end

class Route
  attr_reader :first, :last, :stations
  def initialize(first, last) # Имеет начальную и конечную станцию. Начальная и конечная станции указываются при создании маршрута.
    @first = first
    @last = last
    @stations = [first, last]
  end

  def add_station(station) # Промежуточные станции могут добавляться между начальной и конечной.
    @stations.insert(1, station)
  end

  def delete_station(station) # Может удалять промежуточную станцию из списка
    @stations.delete(station)
  end

  def show_route # Может выводить список всех станций
    @stations
  end
end

class Train
  attr_reader :number, :type, :number_of_wagons

  def initialize(number, type, number_of_wagons) # Имеет номер, тип, количество вагонов (указывается при создани)
    @speed = 0
    @number = number
    @type = type
    @number_of_wagons = number_of_wagons
  end 
 
  def speed # Может набирать скорость
    @speed += 5
  end

  def current_speed  # Может возвращать текущую скорость
    @speed
  end

  def stop # Может тормозить (сбрасывать скорость до нуля)
    @speed = 0
  end

  def take_route(route) # Может принимать маршрут следования
    @route_for_train = route
    @pozition_on_route = 0
    @route_for_train.station[pozition_on_route].add_train(self)
  end

  def attach_wagon # Может прицеплять вагоны, если поезд не движется
    if @speed == 0 
      @number_of_wagons += 1
    end
  end

  def detach_wagon # Может отцеплять вагоны, если поезд не движется
    if @speed == 0 && @number_of_wagons > 0
      @number_of_wagons -= 1
    end
  end

  def move_forward # Может перемещаться вперёд
    @route_for_train.station[@pozition_on_route].remove_train(self)
    @pozition_on_route += 1
    @route_for_train.station[@pozition_on_route].add_train(self)
  end

  def move_back # Может перемещаться назад
    @route_for_train.station[@pozition_on_route].remove_train(self)
    @pozition_on_route -= 1
    @route_for_train.station[@pozition_on_route].add_train(self)
  end

  def show_stations # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
    [
    @route_for_train.station[@pozition_on_route - 1],
    @route_for_train.station[@pozition_on_route],
    @route_for_train.station[@pozition_on_route + 1]
    ]
  end
end

