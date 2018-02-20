class Station

  attr_accessor :name, :trains, :cargo_nums, :passenger_nums

  def initialize(name)
    @name = name
    @trains = {}
    @cargo_nums = []
    @passenger_nums = []
  end
  
  def add_train(train)
    if train.type == 'cargo'
      self.cargo_nums.push(train.num)
    elsif train.type == 'passenger'
      self.passenger_nums.push(train.num)
    end
  end

  def delete_train(train)
    trains.delete(train.num)
      puts "Со станции #{name} отбыл поезд: #{train.num}"
  end

  def print_all_trains
    puts "На станции #{name} находиться #{cargo_nums.size} грузовых и #{passenger_nums.size} пассажирских"
    puts "Грузовые:"
    puts self.cargo_nums.each { |train| " #{train} \n" } 
    puts "Пассажирские:"
    puts self.passenger_nums.each { |train| " #{train} \n" } 
  end

end