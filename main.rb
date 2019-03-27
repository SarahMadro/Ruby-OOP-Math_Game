
require './game'
require './players'
require './questions'

def start_game
    print "Player 1, what is your name? "
    player1_name = gets.chomp
    player1 = Player.new(player1_name)

    print "Player 2, what is your name? "
    player2_name = gets.chomp
    player2 = Player.new(player2_name)

    play_game = true
    player1_turn = true


    while (play_game) do
      turn = Game.new(player1_turn, player1, player2)
      puts turn.new_turn
      turn.ask_question
      if turn.who_won
        play_game = false
      end
      player1_turn = !player1_turn
      end

    print "Play again? (Y/N) * "
    play_again = gets.chomp
    if play_again.upcase == "Y"
      start_game
    end
  end

  start_game
