require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bear'

class TestBear < Minitest::Test
  
  def setup
    @bear = Bear.new(25)
  end

  def test_full_energy
    assert_equal(100, @bear.energy)
  end

  def test_full_food
    assert_equal(100, @bear.food)
  end

  
end