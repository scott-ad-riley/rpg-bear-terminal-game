require_relative 'action'

class Rest < Action

  def initialize(bear, difficulty)
    @bear = bear
    super(difficulty)
    @bear.lose_food(scale(10))
  end

  def do()
    @bear.give_energy(scale(10))
    return {
    	action: "rest"
    }
  end

end