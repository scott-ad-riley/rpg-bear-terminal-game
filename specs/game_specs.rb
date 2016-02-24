require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bear'
require_relative '../rest'
require_relative '../gather'
require_relative '../hunt'

class TestGame < MiniTest::Test

  def setup
    @bear = Bear.new(25)
    @game = Game.new(@bear)
  end

end