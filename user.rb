class User
  @@last_id = 0
  attr_accessor :email, :first_name, :last_name, :surveys
  def initialize(email, first_name, last_name)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @id = (@@last_id += 1)
    @surveys = []
  end

  def show_surveys
    @surveys.each do |survey|
      puts survey.name
    end
  end

  def add_survey(survey)
    @surveys.push(survey)
  end

  def show_questions_with_variants
    @surveys.map do |survey|
      survey.questions.map do |question|
        puts question.text
        question.variants.map do |variant|
          puts variant.text
        end
      end
    end
  end

  def counter_surv_id
    print @surveys.length
  end

  private

  def delete_survey(condition)
    @surveys.delete_if { |survey| survey.name == condition }
  end
end

class Customer < User
  @@last_id = 0
  attr_accessor :email, :first_name, :last_name
  def initialize(email, first_name, last_name)
    super(email, first_name, last_name)
  end

  def role
    :customer
  end
end

class Admin < User
  @@last_id = 0
  attr_accessor :email, :first_name, :last_name
  def initialize(email, first_name, last_name)
    super(email, first_name, last_name)
  end

  def role
    :admin
  end
end