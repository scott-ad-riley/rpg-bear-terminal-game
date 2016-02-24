class Rest

  def initialize(bear)
    @bear = bear
    @bear.lose_food(10)
  end

  def do()
    @bear.give_energy(10)
  end

end