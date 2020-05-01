require_relative 'questionable.rb'


class Question
  class LimitError < StandardError; end
  class CopyrightError < StandardError; end
  include Companiable
  extend Questionable
  @@last_question_id = 0
  @@questions1 = []
  attr_accessor :text, :variants
  def initialize(text)
    @text = text
    @id = (@@last_question_id += 1)
    @variants = []
    @@questions1 << self
  end

  def add_variant(variant)
    @variants.push(variant)
  end

  def counter_variants_id
    puts @variants.length
  end

  def check_limit
  begin
    if @variants.length > 4
      raise LimitError, "Dont create more 4 variants press 2 to stop"
    end
  rescue LimitError => e
    puts e.message
  end
  end

  def check_copyright
    @variants.map do |variant|
      if variant.company == @company
        raise CopyrightError, 'Dont use company name for variant'
      end
    end
  end

  def self.all
    @@questions1
  end

  def self.first
    @@questions1.first
  end

  def self.last
  	@@questions1.last
  end

  private

  def delete_variant(condition)
    @variants.delete_if { |variant| variant.id == condition || variant.text == condition }
  end
end