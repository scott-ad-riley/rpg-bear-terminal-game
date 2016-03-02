require 'minitest/autorun'
require 'minitest/rg'
require_relative '../animal'

class TestAnimal < Minitest::Test

  def setup 
    @animal = Animal.new(1, "Boris", "Lion", 20 )
  end

  def test_animal_has_a_name
    result = @animal.name
    assert_equal( "Boris", result )
  end

  def test_animal_has_a_type
    result = @animal.type
    assert_equal( "Lion", result )
  end

  def test_animal_has_a_damage
    result = @animal.damage
    assert_equal( 20, result )
  end

  def test_animal_damage_within_range
    result = @animal.rand_damage(7)
    assert_includes(5..50, result)
  end

  def test_animal_to_hash
    result = @animal.to_hash()
    assert_equal( {
        name: "Boris",
        type: "Lion",
        damage: 20,
        pretty_name: "Boris the Lion with 20 damage"
      }, result )
  end


end
