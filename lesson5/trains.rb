class Train
  attr_reader :number, :type, :number_of_wagons

  def initialize(number) # Имеет номер, тип, количество вагонов (указывается при создани)
    @speed = 0
    @number = number
    @type = nil
    @number_of_wagons = []
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
    return false unless railway_wagon.type == @type
    @number_of_wagons << railway_wagon if speed == 0
  end

  def detach_wagon # Может отцеплять вагоны, если поезд не движется
    if @speed == 0
      @number_of_wagons.delete(railway_wagon)
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

