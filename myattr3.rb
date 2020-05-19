module MyAccessor
  def my_attr_accessor(*attrs)
    attrs.each do |attr|
      define_method("#{attr}_history") do
        instance_variable_get("@#{attr}_history")
      end
      define_method(attr) do
        instance_variable_get("@#{attr}")
      end
      define_method("#{attr}=") do |val|
        instance_variable_set("@#{attr}", val)
        instance_variable_get("@#{attr}_history") ||
          instance_variable_set("@#{attr}_history", [])
        instance_variable_get("@#{attr}_history") << val
      end
    end
  end
end

class A
  extend MyAccessor

  my_attr_accessor :text, :age

  def initialize(text, age)
    @age = age
    @text = text
    instance_variables.each do |attr|
      instance_variable_set("#{attr}_history", [instance_variable_get(attr)])
    end
  end
end

ob = A.new('text', 2)

ob.text = 'text1'
ob.text = 'text2'
ob.text = 'text3'
ob.text = 'text4'
ob.age = 12
ob.age = 22
ob.age = 32

puts ob.text_history
puts ob.age_history
