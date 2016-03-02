require 'colorize'
require_relative 'bear'
require_relative 'rest'
require_relative 'gather'
require_relative 'hunt'
require_relative 'logger'
require_relative 'viewer'

class Game

  def initialize(bear, difficulty = 1)
    @bear = bear
    @log = Logger.new(@bear)
    @viewer = Viewer.new(@log, @bear)
    @difficulty = difficulty
  end

  def start()
    puts "Difficulty level (hit enter for default):"
    value = gets.chomp
    @difficulty = value.to_i unless value == ""
    system "clear"
    puts "Welcome to Hungry Hungry Bears.(trademark pending) The aim of the game is to stay alive!"
    puts "Your bear has:"
    @viewer.display_bear_state()
    play_turn()
    # could add another bit in here about telling the user final difficulty?
    puts "Sorry! You've died! You lasted #{@log.values.length - 1} days!" 
  end

  def play_turn(prev = nil)
    # this commented conditional stops bear from dying when resting
    return unless @bear.is_alive # || (@bear.food + @bear.health <= 5)
    user_action = ask_user()
    action = user_action.new(@bear, @difficulty)
    result = action.do()
    @log.commit(result)
    # diff_hash = calculate_difference()
    system "clear"
    @viewer.display_bear_state()
    @viewer.display_last_action()
    # output_bear_pretty(diff_hash) 
    play_turn(action)
    return
  end

  # def output_bear_pretty(diff_hash = nil)
  #   health_value = "#{@bear.health}"
  #   energy_value = "#{@bear.energy}"
  #   food_value = "#{@bear.food}"

  #   unless diff_hash.nil?
  #     health_value += " #{diff_hash[:health]}"
  #     energy_value += " #{diff_hash[:energy]}"
  #     food_value += " #{diff_hash[:food]}"
  #   end      
      
  #   puts "Health: #{health_value}"
  #   puts "Food: #{food_value}"
  #   puts "Energy: #{energy_value}"
  #   puts "You can do #{@bear.damage} damage!"
  # end

  def ask_user()
    choices = {
      "rest" => Rest,
      "gather" => Gather,
      "hunt" => Hunt
    }
    puts "What do you want to do today? (Rest/Gather/Hunt)"
    print "> "
    input = gets.chomp.downcase
      until choices.include?(input)
        puts "Sorry, not recognised! Try again:"
        print "> "
        input = gets.chomp.downcase
      end
    return choices[input]
  end

end

bear = Bear.new(25)
game = Game.new(bear)

game.start()