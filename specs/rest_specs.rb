require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bear'
require_relative '../rest'

class TestRest < MiniTest::Test

  def setup
    @bear = Bear.new(25)
    @rest = Rest.new(@bear)
  end

  def test_bear_loses_food
    assert_equal(90, @bear.food)
  end

  def test_increases_bear_energy_by_10
    @bear.lose_energy(20)
    @rest.do(@bear)
    assert_equal(90, @bear.energy)
  end

end