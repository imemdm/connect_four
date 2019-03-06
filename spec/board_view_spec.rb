module ConnectFour
  RSpec.describe BoardView do
    describe "#draw" do
      it "prints an empty board on the console if the grid is empty" do
        grid = [[nil, nil, nil, nil]]
        bv = BoardView.new(grid: grid)
        
        expect { bv.draw }.to output("_ _ _ _\n").to_stdout
      end

      it "prints a color" do
        Cell = Struct.new(:color)
        c1 = Cell.new("x")
        c2 = Cell.new("o")
        grid = [[c1, nil, nil, c2]]
        bv = BoardView.new(grid: grid)

        expect { bv.draw }.to output("x _ _ o\n").to_stdout
      end
    end
  end
end