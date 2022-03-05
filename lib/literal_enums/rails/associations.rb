module LiteralEnums
  module Rails
    module Associations
      private

      def has_many(name, class_name: nil, as: nil)
        class_name ||= name.to_s.classify
        full_class_name = class_name.constantize.name
        foreign_key = as || relative_foreign_key(self.name, relative_to: full_class_name)

        class_eval(<<-RUBY, __FILE__, __LINE__ + 1)
          def #{name}
            #{class_name}.where(#{foreign_key}: self)
          end
        RUBY
      end

      def relative_foreign_key(name, relative_to:)
        path = name.split("::")
        other_path = relative_to.split("::")

        path
          .zip(other_path)
          .drop_while { |a, b| a == b }
          .transpose
          .first
          &.join("_")
          &.underscore()
      end
    end
  end
end
