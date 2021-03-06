module ConnectFour
  class Game
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def play
      puts "#{current_player.name} starts the game"
      while true
        puts ""
        board.view
        puts ""
        puts "#{current_player.name}'s turn (#{current_player.color})"
        board.drop(current_player)
        if board.game_over
          puts game_over_message
          board.view
          return
        else
          switch_players
        end
      end
    end

    private

    attr_reader :board
    attr_accessor :current_player, :other_player

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def game_over_message
      return "#{current_player.name} won" if board.game_over == :winner
      return "The game ended as a tie" if board.game_over == :draw
    end
  end
end