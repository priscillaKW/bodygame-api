module Moped
   module BSON
     class ObjectId
       def as_json
         self.to_s
       end
     end
   end
end
