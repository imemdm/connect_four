module ConnectFour
  class Board
    attr_reader :grid
    
    def initialize(grid: default_grid)
      @grid = grid
    end

    def drop
      set(disc: disc, at: column)
    end
    
    private

    def set(disc:, at:)
      columns = grid.transpose
      columns[at].reverse.each.with_index do |pos, i|
        if pos.nil?
          grid[grid.length - 1 - i][at] = disc
        end
      end
    end

    def column
      1
    end

    def disc
      Disc.new(color: "yellow")
    end
    
    def default_grid
      Array.new(6) { Array.new(7) }
    end
  end
end