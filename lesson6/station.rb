class Station
  include InstanceCounter

  attr_accessor :name
  attr_reader :trains

  class << self
    attr_accessor :all
  end

  def initialize(name)
    @name = name
    @trains = []
    register_instanse
    station_to_all
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

  private

  def station_to_all
    self.class.all ||= []
    self.class.all << self
  end
end
