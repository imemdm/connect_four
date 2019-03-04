module ConnectFour
  RSpec.describe InputHandler do
    describe "#column" do
      it "asks for a column" do
        validator = double(valid?: true)
        ih = InputHandler.new(validator: validator)
        allow(ih).to receive(:ask_for_column) { "Drop disc into column: " }
        allow(ih).to receive(:gets) { "1" }
        expect { ih.column([]) }.to output("Drop disc into column: ").to_stdout 
      end
      it "returns a grid-friendly value" do
        validator = double(valid?: true)
        ih = InputHandler.new(validator: validator)
        allow(ih).to receive(:get_input) { "1" }

        expect(ih.column([])).to eql(0)
      end
    end
  end
end