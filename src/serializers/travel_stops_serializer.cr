require "./mapped_objects/travel_stops"

class TravelStopsSerializer
    def self.transform(received)
        TravelStopsObject.from_json(received).travel_stops
    rescue err
        raise Error::CustomError.new(400, "Invalid travel stops list")
    end
end