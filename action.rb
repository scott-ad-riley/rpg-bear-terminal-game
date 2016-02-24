class Action

	def initialize(difficulty)
		@difficulty = difficulty
	end

	def scale(value)
		return value * @difficulty
	end
end