class Survey
  attr_accessor :name, :questions, :answers
  extend Survable
  include Companiable
  @@surveys1 = []
  @@last_surv_id = 0
  def initialize(name)
    @name = name
    @id = (@@last_surv_id += 1)
    @questions = []
    @answers = []
    @@surveys1 << self
  end

  def add_answer(answer)
    @answers.push(answer)
  end

  def add_questions(question)
    @questions.push(question)
  end

  def show_question
    puts @questions
  end

  def counter_questions_id
    puts @questions.length
  end

  def counter_answers_id
    puts @answers.length
  end

  def self.all
    @@surveys1
  end

  def self.first
    @@surveys1.first
  end

  def self.last
  	@@surveys1.last
  end

  private

  def delete_question(condition)
    @questions.delete_if { |question| question.text == condition }
  end
end