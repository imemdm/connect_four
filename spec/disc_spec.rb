module ConnectFour
  RSpec.describe Disc do
    describe "#initialize" do
      it "is initialized with nil color by default" do
        expect(Disc.new.color).to eq(nil)
      end

      it "can be initialized with a color" do
        disc = Disc.new(color: "yellow")
        expect(disc.color).to eq("yellow")
      end
    end
  end
end