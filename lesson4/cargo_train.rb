class CargoTrain < Train
attr_accessor :number, :type, :wagons

  def initialize(type)
    @type = "Cargo"
    super
  end

end
