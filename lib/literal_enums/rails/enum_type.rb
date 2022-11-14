module LiteralEnums
  module Rails
    class EnumType < ActiveModel::Type::String
      def initialize(enum)
        @enum = enum
      end

      def type
        :enum
      end

      def cast_value(value)
        return value if value.is_a?(@enum)
        @enum.cast(value)
      end

      def serialize(value)
        return value.value if value.is_a?(@enum)
        value
      end
    end
  end
end
