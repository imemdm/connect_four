module ConnectFour
  class InputHandler
    def initialize(validator: validator)
      @validator = validator
    end

    def column(grid)
      valid_value(grid)
    end

    private

    attr_reader :validator

    def get_input
      print ask_for_column
      gets.chomp
    end

    def convert(input)
      input.to_i - 1
    end

    def valid_value(grid)
      v = -1
      loop do
        v = convert(get_input)
        break if validate?(v)
      end
      v
    end

    def validate?(val)
      validator.valid?(val)
    end

    def ask_for_column
      "Drop disc into column: "
    end
  end
end