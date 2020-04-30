class Variant
  include Companiable
  extend Findvariant
  @@last_variant_id=0
  @@variants1 = []
  attr_accessor :text, :id, :weight
  def initialize(text)
    @text = text
    @id = (@@last_variant_id += 1)
    @weight = rand(10)
    @@variants1 << self
  end

  def self.all
    @@variants1
  end

  def self.first
    @@variants1.first
  end

  def self.last
  	@@variants1.last
  end
end
