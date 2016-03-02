require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bear'
require_relative '../animal'

class TestBear < Minitest::Test
  
  def setup
    @bear = Bear.new(25)
    @opponent_easy = Animal.new(1, "Boris", "Lion", 20 )
    @opponent_hard = Animal.new(1, "Gladys", "Honey Badger", 40 )
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

  def test_lose_energy
    @bear.lose_energy(20)
    assert_equal(80, @bear.energy)
  end

  def test_lose_energy_empty
    @bear.lose_energy(110)
    assert_equal(0, @bear.energy)
    assert_equal(90, @bear.health)
  end

  def test_lose_energy_to_death
    @bear.lose_energy(200)
    assert_equal(0, @bear.health)
    assert_equal(0, @bear.energy)
    assert_equal(false, @bear.is_alive)
  end

  def test_give_energy
    @bear.lose_energy(20)
    @bear.give_energy(10)
    assert_equal(90, @bear.energy)
  end

  def test_give_energy_over_cap
    @bear.lose_energy(10)
    @bear.give_energy(20)
    assert_equal(100, @bear.energy)
  end

  def test_lose_food
    @bear.lose_food(10)
    assert_equal(90, @bear.food)
  end

  def test_lose_food_empty
    @bear.lose_food(110)
    assert_equal(0, @bear.food)
    assert_equal(90, @bear.health)
  end

  def test_lose_food_to_death
    @bear.lose_food(200)
    assert_equal(0, @bear.health)
    assert_equal(0, @bear.food)
    assert_equal(false, @bear.is_alive)
  end

  def test_give_food
    @bear.lose_food(20)
    @bear.give_food(10)
    assert_equal(90, @bear.food)
  end

  def test_give_food_over_cap
    @bear.lose_food(10)
    @bear.give_food(20)
    assert_equal(100, @bear.food)
  end

  def test_bear_fight_win
    result = @bear.fight(@opponent_easy)
    assert_equal(true, result[:bear_won])
    assert_equal(80, @bear.health)
  end

  def test_bear_fight_lose
    result = @bear.fight(@opponent_hard)
    assert_equal(false, result[:bear_won])
    assert_equal(60, @bear.health)
  end

end