require "../models/*"

module ApiRequester
    def self.getLocations(ids : Array(Int32))
        ids_list = ids.join(", ")
        api_url = "https://rickandmortyapi.com/graphql"
        query = "query {\n\ttravel_stops: locationsByIds(ids: [#{ids_list}]) {\n    id\n    name\n    type\n    dimension\n    residents {\n    \t  id\n    }\n  }\n}"
        
        response = Crest.post(
            api_url,
            { :query => query },
            json: true
        )
        
        LocationSerializer.transform(response.body)
    rescue
        raise Error::InternalServerError.new
    end
end