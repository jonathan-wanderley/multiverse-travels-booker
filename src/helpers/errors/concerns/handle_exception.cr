module Error
    def self.handleException(err : Exception, env : HTTP::Server::Context)
        env.response.status_code = 500
        env.response.content_type = "application/json"
        return { message: err.message }.to_json
    end
end