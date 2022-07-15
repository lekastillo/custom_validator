class StringInputLengthValidator
    MIN = 10
    MAX = 15
    def initialize(text, options = {})
        @text = text
        @min = options[:min] || MIN
        @max = options[:max] || MAX
    end

    def validate
        @text.length.between?(@min,@max)
    end

end