
class Player

  attr_reader :start_lives
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
    @start_lives = 3
  end

  def lost_life
    self.lives -= 1
  end

  def score
    "#{lives}/#{start_lives}"
  end
end


