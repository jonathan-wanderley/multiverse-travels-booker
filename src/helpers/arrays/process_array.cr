module Helpers
    extend self

    def self.process_array(receivedArray, optimizeQuery, expandQuery)
        base_array = receivedArray
        
        if optimizeQuery == "true"
            base_array = self.optimizeArray(base_array)
        end

        if expandQuery != "true"
            base_array = self.minimizeArray(base_array)
        else
            base_array = base_array.map_with_index { |stop, i|
                {
                    id: stop.id.to_i,
                    name: stop.name,
                    type: stop.type,
                    dimension: stop.dimension
                }
            }
        end

        base_array
    end
end