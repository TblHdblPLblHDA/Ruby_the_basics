module Manufacturer
  def manufacturer(name)
    @name = name
  end

  def show_manufacturer
    @name
  end

  private

  attr_accessor :name
end

module InstanceCounter
  @@instances = 0

  def show_instances
    @@instances
  end

  def register_instances
    @@instances += 1
  end
  
end
