module Error
    def self.handleBaseError(err : BaseError, env : HTTP::Server::Context)
        env.response.status_code = err.status_code
        env.response.content_type = "application/json"
        return { message: err.message }.to_json
    end
end