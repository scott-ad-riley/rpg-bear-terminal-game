require_relative 'bear'
require_relative 'rest'
require_relative 'gather'
require_relative 'hunt'

class Game

  def initialize(bear)
    @bear = bear
    @log = []
  end

  def start()
    puts "Welcome to hungry hungry bears. The aim of the game is to stay alive!"
    play_turn()
    puts "Sorry! You've died!"
  end

  def play_turn(prev = nil)
    return unless @bear.is_alive || (@bear.food + @bear.health <= 5)
    output_bear_pretty() unless prev.nil?
    puts "What do you want to do next? (Rest/Gather/Hunt)"
    print "> "
    input = gets.chomp.downcase
    choices = {
      "rest" => Rest,
      "gather" => Gather,
      "hunt" => Hunt
    }
    action = choices[input].new(@bear)
    action.do()
    bear_stats = {
      health: @bear.health,
      food: @bear.food,
      energy: @bear.energy
    }
    @log.push(bear_stats)
    play_turn(action)
    return
  end

  def output_bear_pretty
    system "clear"
    puts "Health: #{@bear.health}"
    puts "Food: #{@bear.food}"
    puts "Energy: #{@bear.energy}"
    puts "You can do #{@bear.damage} damage!"
  end


end

bear = Bear.new(25)
game = Game.new(bear)

game.start()