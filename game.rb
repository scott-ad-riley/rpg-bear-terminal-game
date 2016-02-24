require_relative 'bear'
require_relative 'rest'
require_relative 'gather'
require_relative 'hunt'

class Game

  def initialize(bear)
    @bear = bear
    @log = [{health: 0, energy: 0, food: 0}]
  end

  def start()
    puts "Welcome to hungry hungry bears. The aim of the game is to stay alive!"
    output_bear_pretty()
    play_turn()
    puts "Sorry! You've died! You lasted #{@log.length - 1} days!"
  end

  def play_turn(prev = nil)
    return unless @bear.is_alive || (@bear.food + @bear.health <= 5)
    user_action = ask_user()
    action = user_action.new(@bear)
    action.do()
    commit_to_log()
    diff_hash = calculate_difference()
    output_bear_pretty(diff_hash) unless prev.nil?
    play_turn(action)
    return
  end

  def output_bear_pretty(diff_hash = nil)
    if diff_hash.nil?
      health_value = "#{@bear.health}"
      energy_value = "#{@bear.energy}"
      food_value = "#{@bear.food}"
    else
      health_value = "#{@bear.health} #{diff_hash[:health]}"
      energy_value = "#{@bear.energy} #{diff_hash[:energy]}"
      food_value = "#{@bear.food} #{diff_hash[:food]}"
    end      
      
    system "clear"
    puts "Health: #{health_value}"
    puts "Food: #{food_value}"
    puts "Energy: #{energy_value}"
    puts "You can do #{@bear.damage} damage!"
  end

  def ask_user()
    puts "What do you want to do today? (Rest/Gather/Hunt)"
    print "> "
    input = gets.chomp.downcase
    choices = {
      "rest" => Rest,
      "gather" => Gather,
      "hunt" => Hunt
    }
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