class ValidationNotImplementedError < StandardError

    def initialize(validation)
        @validation = validation
    end
    def message
        "Validation #{@validation.to_s} not implemented"
    end
end