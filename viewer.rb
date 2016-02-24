class Viewer

  def initialize(bear)
    @bear = bear
    @bear_stats = {
      health: @bear.health,
      food: @bear.food,
      energy: @bear.energy
    }
    @old_bear_stats = nil
  end

  def remember_bear()
    @old_bear_stats = {
      health: @bear.health,
      food: @bear.food,
      energy: @bear.energy
    }
end