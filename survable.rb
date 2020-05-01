module Survable 
  attr_accessor :surveys1
  alias_method :all, :surveys1

  def find(option)
    attribute = option.keys.first
    value = option[attribute]

    all.each do |survey|
      if survey.method(attribute).call == value
        return survey
      end
    end
  end
end