require 'colorize'
require_relative 'log_differ'
class Viewer
	def initialize(log, bear)
		@log = log
    @bear = bear
	end

	def display_bear_state()
		# system "clear"
    health_output = "#{@bear.health}"
    energy_output = "#{@bear.energy}"
    food_output = "#{@bear.food}"

    unless @log.values.length == 1
      log_differ = LogDiffer.new(@log.values)
  		diff_hash = log_differ.build_hash()
      health_output += " #{diff_hash[:health]}"
      energy_output += " #{diff_hash[:energy]}"
      food_output += " #{diff_hash[:food]}"
    end

    puts "Health: #{health_output}"
    puts "Food: #{food_output}"
    puts "Energy: #{energy_output}"
    puts "You can do #{@bear.damage} damage!"
	end

	private

end