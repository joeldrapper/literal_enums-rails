class Enum
  extend LiteralEnums::Rails::Associations

  def self.[](enum)
    LiteralEnums::Rails::EnumType.new(enum)
  end
end
