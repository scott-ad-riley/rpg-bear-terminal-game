require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bear'
require_relative '../gather'

class TestGather < MiniTest::Test

  def setup 
    @bear = Bear.new(25)
    @gather = Gather.new(@bear)
  end

  def test_bear_loses_food
    assert_equal(90, @bear.food)
  end

  def test_bear_gains_food
    @bear.lose_food(50)
    @gather.do()
    assert_equal(60, @bear.food)
  end

  def test_bear_loses_energy
    @gather.do()
    assert_equal(90, @bear.energy)
  end

end