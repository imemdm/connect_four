module ConnectFour
  RSpec.describe Player do
    describe "#initialize" do
      it "raises an exception when initialized with wrong args" do
        expect { Player.new }.to raise_error(ArgumentError)
      end

      it "does not raise an exception when initialized properly" do
        expect { Player.new(name: "Emil", color: "yellow") }.to_not raise_error(ArgumentError)
      end
    end

    describe "#name" do
      it "returns the name" do
        expect(Player.new(name: "Emil", color: "yellow").name).to eq("Emil")
      end
    end

    describe "#color" do
      it "returns the color" do
        expect(Player.new(name: "Emil", color: "yellow").color).to eq("yellow")
      end
    end
  end
end