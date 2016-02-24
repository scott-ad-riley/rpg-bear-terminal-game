class Bear

  attr_reader :energy, :food, :health, :is_alive

  def initialize(damage)
    @damage = damage
    @food = 100
    @energy = 100
    @health = 100
    @is_alive = true
  end

  def take_damage(damage)
    if (@health - damage <= 0)
      @is_alive = false
      @health = 0
    else
      @health -= damage
    end
  end



end