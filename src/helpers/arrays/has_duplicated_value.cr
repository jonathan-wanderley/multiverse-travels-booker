module Helpers
    extend self

    def self.hasDuplicatedValue(receivedArray)
        size_of_received = receivedArray.size
        size_of_uniq = receivedArray.uniq.size
        
        size_of_received != size_of_uniq
    end
end