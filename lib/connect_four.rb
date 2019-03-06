require "connect_four/version"

module ConnectFour
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./connect_four/Player.rb"
require_relative "./connect_four/Disc.rb"
require_relative "./connect_four/Board.rb"
require_relative "./connect_four/InputHandler.rb"
require_relative "./connect_four/Validator.rb"
require_relative "./connect_four/Game.rb"
require_relative "./connect_four/BoardView.rb"



