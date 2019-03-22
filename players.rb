require './main'
require './game'
require './questions'

class Player
  attr_reader = :start_lives
  attr_accessor = :lives, :name

  def initialize(name)
    @lives = lives
    @name = 3
    @start_lives = 3
  end

  def lost_life
    self.lives -= 1
  end

  def score
    "#{lives}/#{total_lives}"
  end
end


