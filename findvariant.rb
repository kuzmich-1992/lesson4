module Findvariant
  attr_accessor :variants1
  alias_method :all, :variants1

  def find(option)
    attribute = option.keys.first
    value = option[attribute]

    all.each do |variant|
      if variant.method(attribute).call == value
        return variant
      end
    end
  end
end