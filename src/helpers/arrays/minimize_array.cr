module Helpers
    extend self

    def self.minimizeArray(receivedArray)
        receivedArray.map(&.id.to_i)
    end
end