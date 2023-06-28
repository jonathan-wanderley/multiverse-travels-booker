class BaseError < Exception
def initialize(status_code : Int32, message)
        super(message)
        @status_code = status_code
    end

    def status_code
        @status_code
    end
end