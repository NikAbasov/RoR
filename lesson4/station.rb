class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
