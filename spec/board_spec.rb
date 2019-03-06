module ConnectFour
  RSpec.describe Board do
    describe "#initialize" do
      it "does not raise an exception when initialized with a grid" do
        expect { Board.new(grid: [nil, nil, nil]) }.to_not raise_error
      end
    end

    describe "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "grid")
        expect(board.grid).to eq("grid")
      end

      it "default grid has 6 rows" do
        expect(Board.new.grid.size).to eq(6) 
      end

      it "default grid has 7 columns" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(7)
        end
      end
    end

    describe "#drop" do
      context "when there are no previous discs in the column" do
        it "drops the disc at the bottom of the column" do
          grid = [[nil, nil, nil], [nil, nil, nil]]  # 2 rows 3 columns example grid
          board = Board.new(grid: grid)
          allow(board).to receive(:column) { 1 }
          turn = double(color: "x")

          board.drop(turn)

          expect(board.grid[1][1]).to_not be_nil
          expect(board.grid[1][1].color).to eq("x")
        end
      end

      context "when there are discs in the column" do
        it "drops the disc right above the previous one in the column" do
          disc1 = double(color: "x")
          grid = [[nil, nil, nil], [nil, disc1, nil]]  # 2 rows 3 columns example grid
          board = Board.new(grid: grid)
          allow(board).to receive(:column) { 1 }
          turn = double(color: "x")

          board.drop(turn)

          expect(board.grid[0][1]).to_not be_nil
          expect(board.grid[0][1].color).to eq("x")
        end
      end
    end

    describe "#game_over" do
      context "when game is won" do
        it "returns :winner if there is a horizontal winning combination" do
          disc = double(color: "x")
          grid = [
            [nil, disc, disc, disc, disc, nil],
          ]
          board = Board.new(grid: grid)
          
          expect(board.game_over).to eq(:winner)
        end

        it "returns :winner if there is a vertical winning combination" do
          disc = double(color: "x")
          grid = [
            [nil, nil, nil, nil],
            [nil, nil, nil, nil],
            [disc, nil, nil, nil],
            [disc, nil, nil, nil],
            [disc, nil, nil, nil],
            [disc, nil, nil, nil],
          ]
          board = Board.new(grid: grid)
          
          expect(board.game_over).to eq(:winner)
        end

        it "returns :winner if there is a \ diagonal winning combination" do
          disc = double(color: "x")
          grid = [
            [disc, nil, nil, nil],
            [nil, disc, nil, nil],
            [nil, nil, disc, nil],
            [nil, nil, nil, disc],
          ]
          board = Board.new(grid: grid)
          
          expect(board.game_over).to eq(:winner)
        end

        it "returns :winner if there is a / diagonal winning combination" do
          disc = double(color: "x")
          grid = [
            [nil, nil, nil, nil, disc, nil],
            [nil, nil, nil, disc, nil, nil],
            [nil, nil, disc, nil, nil, nil],
            [nil, disc, nil, nil, nil, nil],
            [nil, nil, nil, nil, nil, nil],
          ]
          board = Board.new(grid: grid)
          
          expect(board.game_over).to eq(:winner)
        end
      end

      context "when the grid is full without a winning combination" do
        it "returns :draw" do
          disc1 = double(color: "x")
          disc2 = double(color: "o")
          grid = [
            [disc2, disc2, disc1, disc1],
            [disc1, disc1, disc2, disc2]
          ]
          board = Board.new(grid: grid)
          allow(board).to receive(:winner?) { false }
          
          expect(board.game_over).to eq(:draw)
        end
      end

      context "when the game hasn't ended yet" do
        it "returns false" do
          disc = double(color: "x")
          grid = [
            [nil, disc, nil, disc],
            [disc, nil, nil, nil]
          ]
          board = Board.new
          allow(board).to receive(:winner?) { false }
  
          expect(board.game_over).to eq(false)
        end
      end
    end
  end
end