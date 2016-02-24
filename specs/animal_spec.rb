require 'minitest/autorun'
require 'minitest/rg'
require_relative '../animal'

class TestAnimal < Minitest::Test

  def setup 
    @animal = Animal.new( "Boris", "Lion", 20 )
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


end
