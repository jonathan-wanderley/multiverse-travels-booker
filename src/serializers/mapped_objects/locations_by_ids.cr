class LocationsByIdsObject
    include JSON::Serializable

    property data : Data
end

class Data
    include JSON::Serializable

    property travel_stops : Array(TravelStopExpanded)
end

class TravelStopExpanded
    include JSON::Serializable

    property id : String
    property name : String
    property type : String
    property dimension : String
    property residents : Array(Residents)
end

class Residents
    include JSON::Serializable

    property id : String
end
