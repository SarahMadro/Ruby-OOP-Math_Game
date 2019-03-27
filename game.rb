require './players'
require './questions'


class Game

  attr_reader :new_turn

  def initialize (player1_turn, player1, player2)
    @new_turn = '----- NEW TURN -----'
    @player1_turn = player1_turn
    @player1 = player1
    @player2 = player2
    @question = Questions.new
  end

  def ask_question
    if @player1_turn
      puts "#{@player1.name}: #{@question.ask}"
    else
      puts "#{@player2.name}: #{@question.ask}"
    end
    print "* "
    answer = gets.chomp.to_i
    answer_checker answer
  end

  def answer_checker(answer)
    correct = @question.validate(answer)
    if correct
      if @player1_turn
        puts "#{@player1.name}: YES! Your are correct!"
      else
        puts "#{@player2.name}: YES! Your are correct!"
      end
      puts self.get_score
    else
      if @player1_turn
        puts "#{@player1.name}: NOOOOPE!"
        @player1.lost_life
      else
        puts "#{@player2.name}: NOOOOPE!"
        @player2.lost_life
      end
      puts self.get_score
    end
end

def get_score
  if @player1.lives > 0 && @player2.lives > 0
    "#{@player1.name}: #{@player1.score} vs #{@player2.name}: #{@player2.score}"
  end
end

def who_won
  if @player1.lives == 0
    self.game_over @player2
    return true
  elsif @player2.lives == 0
    self.game_over @player1
    return true
  else
    false
  end
end

def game_over (winner)
  puts "#{winner.name} wins with a score of #{winner.score}"
  puts "------GAME OVER------"
  puts "GOODBYE!"
end
end

