module ConnectFour
  RSpec.describe Validator do
    describe "#valid?" do
      it "returns false if the column is out of range" do
        grid = [[nil, nil, nil]]
        v = Validator.new(grid: grid)
        expect(v.valid?(value: 5)).to be(false)
      end

      it "returns false if the column is full" do
        grid = [
          ["x", nil, nil],
          ["o", nil, nil],
          ["x", nil, nil]
        ]
        v = Validator.new(grid: grid)
        expect(v.valid?(value: 0)).to be(false)
      end

      it "returns true if the column value is valid" do
        grid = [
          [nil, nil, nil],
          ["x", nil, nil],
        ]
        v = Validator.new(grid: grid)
        expect(v.valid?(value: 0)).to be(true)
      end
    end
  end
  
end