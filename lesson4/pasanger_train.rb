class PasangerTrain < Train
  attr_accessor :number, :type, :wagons

  def initialize(type)
    @type = "Pasanger"
    super
  end
end
