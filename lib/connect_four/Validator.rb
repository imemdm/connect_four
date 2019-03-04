module ConnectFour
  class Validator
    def initialize(grid: grid)
      @grid = grid
    end

    def valid?(value:)
      !out_of_range?(value) && !column_full?(value)
    end

    private

    attr_reader :grid

    def out_of_range?(val)
      val > columns || val < 0
    end

    def column_full?(val)
      !grid[0][val].nil?
    end

    def columns
      grid[0].length - 1
    end

    def rows
      grid.length - 1
    end
  end
end