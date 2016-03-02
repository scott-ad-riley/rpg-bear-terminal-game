require_relative 'action'
require_relative 'animal'
class Hunt < Action

  def initialize(bear, difficulty)
    @bear = bear
    super(difficulty)
    bear.lose_food(scale(10))
    @opponent = Animal.new(@difficulty)
  end

  def do()
    result = @bear.fight(@opponent)
    result[:action] = "hunt"
    @bear.give_food(30) if result[:bear_won]
    @bear.lose_energy(20)
    return result
	end

end