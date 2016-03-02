class Logger
  attr_reader :values
	def initialize(bear)
		@values = [{health: 100, energy: 100, food: 100, action: nil}] # feels weird to put log in here?
		@bear = bear
	end

	def commit(action_result)
		bear_state = build_hash()
		bear_state[:action] = action_result
		@values.push(bear_state)
	end

	private

	def build_hash()
		return {
	      health: @bear.health,
	      food: @bear.food,
	      energy: @bear.energy
	    }
	end

end