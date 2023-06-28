class TravelPlanObject
    include JSON::Serializable

    property id : Int32
    property travel_stops : Array(Int32)
end