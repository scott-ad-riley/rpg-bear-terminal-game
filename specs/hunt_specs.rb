require 'minitest/autorun'
require 'minitest/rg'
require_relative '../hunt'
require_relative '../bear'

class TestHunt < MiniTest::Test

  def setup
    @bear = Bear.new(25)
    @hunt = Hunt.new(@bear)
  end

  def test_bear_loses_food
    assert_equal(90, @bear.food)
  end

  def test_increases_food_to_max
    @hunt.do()
    assert_equal(100, @bear.food)
  end

  def test_increases_food
    @bear.lose_food(50)
    @hunt.do()
    assert_equal(70, @bear.food)
  end

  def test_loses_energy
    @hunt.do()
    assert_equal(80, @bear.energy)
  end

end