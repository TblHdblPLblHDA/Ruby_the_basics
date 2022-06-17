class Station
  attr_reader :name

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

  def show_name
    @name
  end
end
