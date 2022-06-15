require_relative 'train'
class PassengerTrain < Train
  
  def attach_wagon
    if speed == 0
      @passenger_wagons += 1
    end
  end

  def detach_wagon
    if speed == 0 && @passenger_wagons > 0
      @passenger_wagons -= 1
    end
end
