require_relative 'train'
class PassengerTrain < Train
  def (number)
    super
    @type = :passenger
  end
end
