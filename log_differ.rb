class LogDiffer 

  def initialize (log_values)
    @log = log_values
    @diff_hash = nil
  end

  def build_hash()
    @diff_hash = construct_diff_hash()
    return prettify_diff_hash()
  end

  def construct_diff_hash()
    return {
      health: @log[-1][:health] - @log[-2][:health],
      energy: @log[-1][:energy] - @log[-2][:energy],
      food: @log[-1][:food] - @log[-2][:food]
    }
  end

  def prettify_diff_hash()
    return if @diff_hash.nil?
    for key, value in @diff_hash
      if value == 0
        @diff_hash[key] = ""
      else
        @diff_hash[key] = prettify_hash_value(value)
      end
    end
  end

  def prettify_hash_value(value)
    end_value = value.to_s.delete('-')
    arrows = ["", "↑", "↓"]
    color = [nil, :green, :red]
    state = value <=> 0
    end_value.to_s.prepend(arrows[state])
    return end_value.colorize(color[state])
  end

end