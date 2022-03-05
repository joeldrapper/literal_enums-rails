module LiteralEnums
  module Rails  
    class EnumSerializer < ::ActiveJob::Serializers::ObjectSerializer
      def serialize?(object)
        object.is_a? Enum
      end

      def serialize(enum)
        super(
          {
            "class" => enum.class.name,
            "value" => enum.value
          }
        )
      end

      def deserialize(hash)
        hash["class"].constantize.cast(hash["value"])
      end
    end
  end
end
