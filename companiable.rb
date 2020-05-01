module Companiable
  attr_accessor :company
  def initialize(namecompany)
    @company = namecompany
  end

  def add_name_company(namecompany)
    @company = namecompany
  end

  def show_company
    puts @company
  end
end