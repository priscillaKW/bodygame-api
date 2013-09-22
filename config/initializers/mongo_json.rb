module Moped
   module BSON
     class ObjectId
       def as_json
         self.to_s
       end
     end
   end
end

module Mongoid
  module Document
    def as_json(options = {})
      super(options).tap do |attrs|
        attrs.delete("_id")
        attrs["id"] = self.persisted? ? self.id : nil
      end
    end
  end
end
