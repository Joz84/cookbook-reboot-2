class Recipe
  attr_reader :name, :description, :prep_time
  def initialize(attrs = {})
    @name = attrs[:name]
    @description = attrs[:description]
    @done = attrs[:done] || false
    @prep_time = attrs[:prep_time] || "No time"
  end

  def done!
    @done = true
  end

  def done?
    @done
  end
end
