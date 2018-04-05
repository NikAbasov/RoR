class Station
  include InstanceCounter

  attr_accessor :name
  attr_reader :trains

  STATION_NAME = /^[A-Z]{1}[a-z]+$/

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @@stations << self
    validate!
    @trains = []
    register_instanse
  end

  def valid?
    validate!
  rescue
    false
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

  def validate!
    raise "Название станции не может быть пустым" if name.nil?
    raise "Название станции должно быть на латинице и начинаться с заглавной буквы" if name !~ STATION_NAME
    true
  end
end
