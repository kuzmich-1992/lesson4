module StrongAccessor
  def strong_attr_accessor(attr, string)
    define_method(attr) do
      instance_variable_get("@#{attr}")
    end
    define_method("#{attr}=") do |val|
      if val.class == (string)
        instance_variable_set("@#{attr}", val)
      else
        raise TypeError, "create only string attr!"
      end
    end
  end
end

class A
  extend StrongAccessor

  strong_attr_accessor :text, String

  def initialize
    @text = text
  end
end

ob = A.new
ob.text = 12
puts ob.text
