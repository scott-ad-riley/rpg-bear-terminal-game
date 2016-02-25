class Logger
  attr_reader :values
	def initialize(bear)
		@values = [{health: 100, energy: 100, food: 100}] # feels weird to put log in here?
		@bear = bear
	end

	def commit()
		current_bear = build_hash()
		@values.push(current_bear)
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