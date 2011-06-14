module Mongoid
  module BaseQuery
      attr_reader :value
      
      def initialize value
        @value = value
      end

      def to_mongo_query
        raise "Must be implemented by subclass"
      end
      
      def hash?
        !value.kind_of?(Array)
      end      
      
      protected

      def to_point v
        v.to_lng_lat if v.respond_to? :to_lng_lat
      end
    end
  end
end