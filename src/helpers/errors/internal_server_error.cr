require "./concerns/*"

module Error
    class InternalServerError < BaseError
        def initialize()
            @message = "Internal server error"
            @status_code = 500
        end

        def status_code
            @status_code
        end
    end
end