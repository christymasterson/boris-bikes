require_relative 'bike'

class DockingStation
  attr_reader :bikes

def initialize
  @bikes = []
end

  def dock(bike)
    fail "Docking station full" if (@bikes.count >= 20)
    @bikes << bike
  end

  def release_bike
    fail "No bikes available" unless @bikes.empty? == false
    @bikes.pop
  end


  # def bike
  #   @bike
  # end

end
