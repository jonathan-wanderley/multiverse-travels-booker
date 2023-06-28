require "./concerns/*"

module Error
    def self.errorHandler(err, env : HTTP::Server::Context)
        if typeof(err)==Exception
            return self.handleException(err, env)
        else 
            return self.handleBaseError(err, env)
        end
    end
end