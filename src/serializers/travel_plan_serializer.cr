require "./mapped_objects/travel_plan"

class TravelPlanSerializer
    def transform(received)
        TravelPlanObject.from_json(received)
    end
end