require 'colorize'
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
  		diff_hash = build_diff()
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

	def build_diff()
    result = {
      health: @log.values[-1][:health] - @log.values[-2][:health],
      energy: @log.values[-1][:energy] - @log.values[-2][:energy],
      food: @log.values[-1][:food] - @log.values[-2][:food]
    }
    arrows = ["", "↑", "↓"]
    color = [nil, :green, :red]
    for key, value in result
      if result[key] == 0
        result[key] = ""
        next
      end
      state = value <=> 0
      result[key] = result[key].to_s.delete('-')
      result[key] = result[key].to_s.prepend(arrows[state])
      result[key] = result[key].colorize(color[state])
      # would love to know the ruby-way for the above... 
      # for some reason it won't let me modify value in place inside the loop...or maybe i'm going crazy
    end
    return result
	end
end