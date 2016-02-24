class Gather 

  def initialize(bear)
    @bear = bear
    @bear.lose_food(10)
  end

  def do()
    @bear.give_food(20)
    @bear.lose_energy(10)
  end
end


