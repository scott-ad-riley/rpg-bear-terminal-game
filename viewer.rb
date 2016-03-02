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
    puts "Damage: #{@bear.damage}"
	end

  def display_last_action()
    action_result = @log.values.last[:action]
    unless action_result[:action] == "hunt"
      puts "You just #{action_result[:action]}ed!"
    else
      result = (action_result[:bear_won]) ? "won" : "lost"
      puts "You just fought #{action_result[:pretty_name]} and #{result}!"
    end
  end

end