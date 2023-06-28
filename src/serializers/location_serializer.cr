require "./mapped_objects/locations_by_ids"

class LocationSerializer
    def self.transform(received)
        LocationsByIdsObject.from_json(received).data.travel_stops
    end
end