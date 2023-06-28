module Helpers
    extend self

    def self.optimizeArray(receivedArray)
        receivedArray.sort { |a, b|
            sort_value = 0
            if a.residents.size != b.residents.size
                sort_value = a.residents.size <=> b.residents.size
            else
                sort_value = a.name > b.name ? 1 : -1
            end

            sort_value
        }
    end
end