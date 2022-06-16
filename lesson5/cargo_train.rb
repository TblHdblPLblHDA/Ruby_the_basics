require_relative 'train'
class CargoTrain < Train
  def (number)
    super
    @type = :cargo
  end
end
