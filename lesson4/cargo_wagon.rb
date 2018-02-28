class CargoWagon < Wagon
  attr_reader :type

  def initialize
    @type = "Cargo"
  end
end
