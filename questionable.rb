module Questionable
  attr_accessor :questions1
  alias_method :all, :questions1

  def find(option)
    attribute = option.keys.first
    value = option[attribute]

    all.each do |question|
      if question.method(attribute).call == value
        return question
      end
    end
  end
end