
class Questions

  attr_accessor :number1, :number2

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
  end

  def ask
    "What does #{@number1} + #{@number2} equal?"
  end

  def answer
    @number1 + @number2
  end

  def validate x
    self.answer == x
  end

end







