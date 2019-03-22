
require './players'
require './questions'

class Game

  attr_reader :new_turn

  def initialize player1, player2
    @new_turn = "----- NEW TURN -----"
    @player1 = player1_name
    @player2 = player2_name
    @question = Question.new
    @player1_turn = player1_turn
  end

  def ask_question
    if @player1_turn
      puts "#{@player1.name}: #{@question.ask}"
    else
      puts "#{@player2.name}: #{question.ask}"
    end
    print "* "
    answer = $stdin.gets.chomp.to_i
    answer_checker answer
  end

  def answer_checker answer
    correct = @question.answer_checker(answer)
    if correct
      if @player1_turn
        puts "#{player1_name}: YES! Your are correct!"
      else
        puts "#{player2.name}: YES! Your are correct!"
      end
      puts self.get_score
    else
      if @player1_turn
        puts "#{@player1.name}: NOOOOPE!"
        @player1.lost_lives
      else
        puts "#{@player2.name}: NOOOOPE!"
        @player2.lost_lives
      end
      puts self.get_score
    end
end

def get_score
  if @player1.lives > 0 && @player2.lives > 0
    "#{@player1.name}: #{player1.score} vs #{@player2.name}: #{@player2.score}"
  end
end

def who_won
  if @player1.lives == 0
    self.end_game @player2
    return true
  elsif @player2.lives == 0
    self.end_game @player1
    return true
  else
    false
  end
end

def game_over winner
  puts "#{winner.name} wins with a score of #{winner.score}"
  puts "------GAME OVER------"
  puts "GOODBYE!"
end
end

#MAIN#

def start_game
    print "Player 1, what is your name?"
    player1_name = $stdin.gets.chomp
    player1 = Player.new(player1.name)

    print "Player 2, what is your name?"
    player2_name = $stdin.gets.chomp
    player2 = Player.new(player2.name)

    player1_turn = true
    play_game = true

    while (play_game) do
      raise turn.inspect
      turn = Turn.new(player1_turn, player1, player2)
      puts turn.new_turn
      turn.question
      if turn.did_player_win
        continue = false
      end
      player1_turn = !player1_turn
    end

    print "Play again? (Y/N)"
    play_again = $stdin.gets.chomp
    if play_again == "Y"
      play_game
    end
  end

  #PLAYERS#

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

#QUESTIONS#

class Questions

  attr_accessor :number1, :number2

  def initialize(number1, number2)
    @number1 = rand(1..20)
    @number2 = rand(1..20)
  end

  def question
    "What does #{@number1} + #{@number2} equal?"
  end

  def answer
    @number1 + @number2
  end

  def validate x
    self.answer == x
  end

end

