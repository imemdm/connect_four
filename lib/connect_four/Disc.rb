module ConnectFour
  class Disc
    attr_reader :color
    
    def initialize(color: nil)
      @color = color
    end
  end
end