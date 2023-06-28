require "./concerns/*"

module Error
    class CustomError < BaseError
        def initialize(status_code, message)
            super(status_code, message)
        end

        def status_code
            @status_code
        end
    end
end