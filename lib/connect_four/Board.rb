module ConnectFour
  class Board
    attr_reader :grid
    
    def initialize(grid: default_grid)
      @grid = grid
      @board_view = BoardView.new(grid: grid)
    end

    def drop(turn)
      color = turn.color
      set(disc: disc(color), at: column)
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def view
      board_view.draw
    end
    
    private

    attr_reader :board_view

    def winner?
      w = grid[0].length
      h = grid.length

      # horizontal
      h.times do |row|
        limit = w - 3
        limit.times do |col|
          next if get(row, col).nil?

          positions = []

          (1..3).each { |n| positions << get(row, col + n) if !get(row, col + n).nil? }

          if positions.length == 3 && positions.all? { |pos| pos.color == get(row, col).color } 
            return true
          end
        end
      end

      # vertical
      w.times do |col|
        limit = h - 3
        limit.times do |row|
          next if get(row, col).nil?

          positions = []

          (1..3).each { |i| positions << get(row + i, col) if !get(row + i, col).nil? }

          if positions.length == 3 && positions.all? { |pos| pos.color == get(row, col).color } 
            return true
          end
        end
      end

      # \ diagonal
      w_limit = w - 3
      w_limit.times do |col|
        h_limit = h - 3
        h_limit.times do |row|
          next if get(row, col).nil?

          positions = []

          (1..3).each { |i| positions << get(row + i, col + i) if !get(row + i, col + i).nil? }

          if positions.length == 3 && positions.all? { |pos| pos.color == get(row, col).color}
            return true
          end
        end
      end

      # / diagonal
      w_limit = w - 3
      w_limit.times do |col|
        col = 3 + col
        h_limit = h - 3
        h_limit.times do |row|
          next if get(row, col).nil?

          positions = []

          (1..3).each { |i| positions << get(row + i, col - i) if !get(row + i, col - i).nil? }

          if positions.length == 3 && positions.all? { |pos| pos.color == get(row, col).color}
            return true
          end
        end
      end

      return false
    end

    def draw?
      grid.all? do |row|
        row.all? { |disc| !disc.nil? }
      end
    end

    def get(row, col)
      grid[row][col]
    end

    def set(disc:, at:)
      columns = grid.transpose
      columns[at].reverse.each.with_index do |pos, i|
        if pos.nil?
          grid[grid.length - 1 - i][at] = disc
          break
        end
      end
    end

    def column
      InputHandler.new(validator: Validator.new(grid: grid)).column(grid)
    end

    def disc(color)
      Disc.new(color: color)
    end
    
    def default_grid
      Array.new(6) { Array.new(7) }
    end
  end
end