class TravelPlanController
    get "/travel_plans" do |env|
        expandQuery = env.params.query["expand"]?
        optimizeQuery = env.params.query["optimize"]?
        travel_plan_list = Travel_Plan.all.to_a

        if optimizeQuery == "true" || expandQuery == "true"
            travel_plan_list = travel_plan_list.map_with_index { |travel, i|
                received_stops = ApiRequester.getLocations(travel.travel_stops.not_nil!)
                stops = Helpers.process_array(received_stops, optimizeQuery, expandQuery)

                new_travel_plan = {
                    :id           => travel.id,
                    :travel_stops => stops,
                }

                new_travel_plan
            }
        end

        env.response.content_type = "application/json"
        travel_plan_list.to_json
    rescue err : BaseError
        Error.handleBaseError(err, env)
    rescue err
        Error.handleException(err, env)
    end

    get "/travel_plans/:id" do |env|
        id = env.params.url["id"]
        optimizeQuery = env.params.query["optimize"]?
        expandQuery = env.params.query["expand"]?

        travel_plan = Travel_Plan.find(id)
        if !travel_plan
            raise Error::CustomError.new(404, "Travel plan not found")
        end

        if optimizeQuery == "true" || expandQuery == "true"
            received_stops = ApiRequester.getLocations(travel_plan.travel_stops.not_nil!)
            
            stops = Helpers.process_array(received_stops, optimizeQuery, expandQuery)

            new_travel_plan = {
                :id           => travel_plan.id,
                :travel_stops => stops,
            }
            travel_plan = new_travel_plan
        end

        env.response.content_type = "application/json"
        travel_plan.to_json
    rescue err : BaseError
        Error.handleBaseError(err, env)
    rescue err
        Error.handleException(err, env)
    end

    post "/travel_plans" do |env|
        stop_list = TravelStopsSerializer.transform(env.request.body.not_nil!)
        if !stop_list || stop_list.size == 0
            raise Error::CustomError.new(400, "Invalid travel stops list")
        end

        if Helpers.hasDuplicatedValue(stop_list)
            raise Error::CustomError.new(400, "You travel list has duplicated stops")
        end

        travel = Travel_Plan.create(travel_stops: stop_list)

        env.response.status_code = 201
        env.response.content_type = "application/json"
        travel.to_json
    rescue err : BaseError
        Error.handleBaseError(err, env)
    rescue err
        Error.handleException(err, env)
    end

    put "/travel_plans/:id" do |env|
        id = env.params.url["id"]
        stop_list = TravelStopsSerializer.transform(env.request.body.not_nil!)
        if !stop_list || stop_list.size == 0
            raise Error::CustomError.new(400, "Invalid travel stops list")
        end

        found_travel = Travel_Plan.find(id)
        if !found_travel
            raise Error::CustomError.new(404, "Travel plan not found")
        end

        Travel_Plan.where { _id == id }.update { {:travel_stops => stop_list} }
        updated_travel = Travel_Plan.find(id)

        env.response.content_type = "application/json"
        updated_travel.to_json
    rescue err : BaseError
        Error.handleBaseError(err, env)
    rescue err
        Error.handleException(err, env)
    end

    delete "/travel_plans/:id" do |env|
        id = env.params.url["id"]

        travel_plan = Travel_Plan.find(id)
        if travel_plan
            travel_plan.destroy
        end

        env.response.status_code = 204
    rescue err
        env.response.status_code = 204
    end
end
