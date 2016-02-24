class Bear

  attr_reader :energy, :food, :health, :is_alive, :damage

  def initialize(damage)
    @damage = damage
    @food = 100
    @energy = 100
    @health = 100
    @is_alive = true
  end

# does bear take damage or give damage?
  def take_damage(damage)
    if (@health - damage <= 0)
      @is_alive = false
      @health = 0
    else
      @health -= damage
    end
  end

  def lose_energy(energy)
    if (@energy - energy <= 0)
      difference = (@energy - energy) * - 1
      @energy = 0
      take_damage(difference)
    else
      @energy -= energy
    end  
  end

  def give_energy(energy)
    if (@energy + energy > 100)
      @energy = 100
    else
      @energy += energy
    end  
  end

  def lose_food(food)
    if (@food - food <= 0)
      difference = (@food - food) * - 1
      @food = 0
      take_damage(difference)
    else
      @food -= food
    end  
  end

  def give_food(food)
    if (@food + food > 100)
      @food = 100
    else
      @food += food
    end  
  end    

end