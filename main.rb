
require './game'
require './players'
require './questions'

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
