module ConnectFour
  class BoardView
    def initialize(grid:)
      @grid = grid
    end

    def draw
      grid.each do |row|
        puts row.map { |cell| cell.nil? ? "_" : cell.color }.join(" ")
      end
    end

    private 

    attr_reader :grid
  end
end