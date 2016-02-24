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

  def test_full_health
    assert_equal(100, @bear.health)
  end

  def test_take_damage
    @bear.take_damage(20)
    assert_equal(80, @bear.health)
  end

  def test_take_damage_to_death
    @bear.take_damage(101)
    assert_equal(0, @bear.health)
    assert_equal(false, @bear.is_alive)
  end

end