class StringInputLengthError < StandardError

    def initialize(options)
        @min = options[:min] || MIN
        @max = options[:max] || MAX
    end

    def message
        "The length of the input must be between #{@min} and #{@max} characters"
    end
end