class Hunt

  def initialize(bear)
    @bear = bear
    bear.lose_food(10)
  end

  def do()
    @bear.give_food(30)
    @bear.lose_energy(20)
  end

end