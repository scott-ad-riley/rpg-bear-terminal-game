class Animal

	attr_reader :name, :type, :damage

  def initialize(difficulty, name = nil, type = nil, damage = nil)
    @name = (name) ? name : rand_name()
    @damage = (damage) ? damage : rand_damage(difficulty)
    @type = (type) ? type : rand_type()
  end

  def rand_name
    return ["Boris", "Gladdis", "Rick", "Pete", "Scott", "Val", "Jeoff", "Voytek", "Adam", "Alisair","Alison","Claire"].sample
  end

  def rand_type
    return ["Giraffe", "Honey Badger", "Lion", "Tiger", "Gorilla", "Python", "Ant", "Software Developer", "Monkey", "Human", "Penguin","Snow Leopard"].sample
  end

  def rand_damage(difficulty)
    damage_limit = 40
    damage_offset = 5 # to make sure we dont get animals with 0 damage
    randomiser = Random.new
    result = randomiser.rand(40) ** difficulty / 40 ** (difficulty - 1)
    return (damage_limit + damage_offset) - result # we want a number that tends towards the max damage with difficulty
  end

  def to_hash
    result = {
      name: @name,
      type: @type,
      damage: @damage,
      pretty_name: "#{@name} the #{@type} with #{@damage} damage"
    }
  end


end