require_relative 'action'
class Hunt < Action

  def initialize(bear, difficulty)
    @bear = bear
    super(difficulty)
    bear.lose_food(scale(10))
  end

  def do()
    @bear.give_food(30)
    @bear.lose_energy(scale(20))
  end

end