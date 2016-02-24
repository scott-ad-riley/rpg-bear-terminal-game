require_relative 'action'
class Gather < Action

  def initialize(bear, difficulty)
    @bear = bear
    super(difficulty)
    @bear.lose_food(scale(10))
  end

  def do()
    @bear.give_food(20)
    @bear.lose_energy(scale(10))
  end
end


