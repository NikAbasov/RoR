class Station
  include InstanceCounter

  attr_accessor :name
  attr_reader :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    register_instanse
    @@stations << self
  end

  def add_train(train)
    @trains << train
  end

  def departure_train(train)
    @trains.delete(train)
  end

  def trains_list
    @trains.each { |x| puts "Поезд №#{x.number}" }
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end
end
