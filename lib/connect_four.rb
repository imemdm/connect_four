require "connect_four/version"

module ConnectFour
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./connect_four/Player.rb"
require_relative "./connect_four/Disc.rb"
require_relative "./connect_four/Board.rb"
