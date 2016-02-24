require_relative 'bear'
require_relative 'rest'
require_relative 'gather'
require_relative 'hunt'

class Game

  def initialize(bear, difficulty = 1)
    @bear = bear
    @log = [{health: 100, energy: 100, food: 100}]
    @difficulty = difficulty
  end

  def start()
    puts "Difficulty level (hit enter for default):"
    value = gets.chomp
    @difficulty = value.to_i unless value == ""
    system "clear"
    puts "Welcome to Hungry Hungry Bears.(trademark pending) The aim of the game is to stay alive!"
    puts "Your bear has:"
    output_bear_pretty()
    play_turn()
    # could add another bit in here about telling the user final difficulty?
    puts "Sorry! You've died! You lasted #{@log.length - 1} days!" 
  end

  def play_turn(prev = nil)
    # this commented conditional stops bear from dying when resting
    return unless @bear.is_alive # || (@bear.food + @bear.health <= 5)
    user_action = ask_user()
    action = user_action.new(@bear, @difficulty)
    action.do()
    commit_to_log()
    diff_hash = calculate_difference()
    system "clear"
    output_bear_pretty(diff_hash) 
    play_turn(action)
    return
  end

  def output_bear_pretty(diff_hash = nil)
    health_value = "#{@bear.health}"
    energy_value = "#{@bear.energy}"
    food_value = "#{@bear.food}"

    unless diff_hash.nil?
      health_value += " #{diff_hash[:health]}"
      energy_value += " #{diff_hash[:energy]}"
      food_value += " #{diff_hash[:food]}"
    end      
      
    puts "Health: #{health_value}"
    puts "Food: #{food_value}"
    puts "Energy: #{energy_value}"
    puts "You can do #{@bear.damage} damage!"
  end

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

  def commit_to_log()
    bear_stats = {
      health: @bear.health,
      food: @bear.food,
      energy: @bear.energy
    }
    @log.push(bear_stats)
  end

  def calculate_difference()
    result_hash = {
      health: @log[-1][:health] - @log[-2][:health],
      energy: @log[-1][:energy] - @log[-2][:energy],
      food: @log[-1][:food] - @log[-2][:food]
    }
    return result_hash
  end

end

bear = Bear.new(25)
game = Game.new(bear)

game.start()