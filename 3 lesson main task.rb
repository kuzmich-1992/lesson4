class User
  @@last_id = 0
  attr_accessor :email, :first_name, :last_name
  def initialize(email, first_name, last_name)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @id = (@@last_id += 1)
  end
end

class Survey
  @@last_surv_id = 0
  attr_accessor :name, :questions
  def initialize(name)
    @name = name
    @id = (@@last_surv_id += 1)
    @questions = []
  end

  def add_questions(question)
    @questions.push(question)
  end

  def show_question
    puts @questions
  end

  def show_questions_with_variants
    @questions.map do |question|
      puts question.text
      question.variants.map do |variant|
        puts variant.text
      end
    end
  end
end

class Question
  @@last_question_id = 0
  attr_accessor :text, :variants
  def initialize(text)
    @text = text
    @id = (@@last_question_id += 1)
    @variants = []
  end

  def add_variant(variant)
    @variants.push(variant)
  end

  def delete_variant(condition)
    @variants.delete_if { |variant| variant.id == condition || variant.text == condition }
  end
end

class Variant
  @@last_variant_id=0
  attr_accessor :text, :id, :weight
  def initialize(text)
    @text = text
    @id = (@@last_variant_id += 1)
    @weight = rand(10)
  end
end

class Answer
  @@last_answer_id=0
  attr_accessor :text, :weightanswer
  def initialize
    @id = (@@last_answer_id += 1)
    @weight_answer = weightanswer
    # @user_id = user_id
    # @survey_id = survey_id
    # @variant_id = variant_id
  end
end

puts 'add email,firstname,lastname'
email = gets.chomp
first_name = gets
last_name = gets.chomp
user = User.new(email, first_name, last_name)

puts 'add survey name'
name = gets
survey = Survey.new(name)

loop do
  puts 'press 1 to add new question , press 2 to stop'
  input = gets.to_i
  if input == 1
    puts 'print you text for question'
    text = gets.chomp
    question = Question.new(text)
    survey.add_questions(question)
    loop do
      puts 'press 1 to add new variant, press 2 to stop'
      inputvar = gets.to_i
      if inputvar == 1
        puts 'print your text variant'
        text = gets.chomp
        variant = Variant.new(text)
        question.add_variant(variant)
      end
      break if inputvar == 2
    end
  end
  break if input == 2
end

puts 'lets start survey'

arr_weights = []

survey.questions.each do |question|
  puts question.text
  question.variants.each do |variant|
    puts variant.text
    puts 'id of variant is'
    puts variant.id
  end

  puts 'enter id of the selected variant'

  input = gets.to_i

  question.variants.each do |variant|
    if input == variant.id
      puts 'you have chosen variant'
      puts variant.text
      weight_answer = variant.weight
      arr_weights.push(weight_answer)
    end
  end
end

answer = Answer.new

sum = 0

arr_weights.each do |weight|
  sum += weight
end

puts 'total weight of answers'
puts sum
