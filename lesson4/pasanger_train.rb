class PasangerTrain < Train

	def initialize(number)
	  @speed = 0
    @number = number
    @wagons = []
    @type = {}
  end
end
