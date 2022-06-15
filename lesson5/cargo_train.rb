require_relative 'train'
class CargoTrain < Train
  
  def attach_wagon
    if speed == 0
      @cargo_wagons += 1
    end
  end
  
  def detach_wagon
    if speed == 0 && @cargo_wagons > 0
      @cargo_wagons -= 1
    end
  end
end
