require_relative 'station'
require_relative 'route'
require_relative 'trains'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'railway_wagon'
require_relative 'railway_wagon_passenger'
require_relative 'railway_wagon_cargo'
require_relative 'interface'
require_relative 'module'

interface = Interface.new
interface.start
