require_relative 'answer.rb'
require_relative 'companiable.rb'
require_relative 'findvariant.rb'
require_relative 'question.rb'
require_relative 'questionable.rb'
require_relative 'survable.rb'
require_relative 'survey.rb'
require_relative 'user.rb'
require_relative 'variant.rb'

puts %{ 1 - Create Admin
        2 - Create Customer
}

var = gets.to_i

case var

when 1

  puts 'add email,firstname,lastname'
  email = gets.chomp
  first_name = gets.chomp
  last_name = gets.chomp
  user = Admin.new(email, first_name, last_name)

when 2

  puts 'add email,firstname,lastname'
  email = gets.chomp
  first_name = gets
  last_name = gets.chomp
  user = Customer.new(email, first_name, last_name)

end

loop do
puts 'press 1 for create new survey press 2 to stop'
inputz = gets.to_i
if inputz == 1
  puts 'print survey name'
  name = gets
  survey = Survey.new(name: name)
  user.add_survey(survey)
  puts 'print name of company who create survey'
  namecompany = gets
  survey.add_name_company(namecompany)

loop do
  puts 'press 1 to add new question , press 2 to stop'
  input = gets.to_i
  if input == 1
    puts 'print you text for question'
    text = gets.chomp
    question = Question.new(text)
    survey.add_questions(question)
    puts 'print name of company who create Question'
    namecompany = gets
    question.add_name_company(namecompany)
    loop do
      puts 'press 1 to add new variant, press 2 to stop'
      inputvar = gets.to_i
      if inputvar == 1
        puts 'print your text variant'
        text = gets.chomp
        variant = Variant.new(text)
        question.add_variant(variant)
        puts 'print name of company who create variant'
        namecompany = gets
        variant.add_name_company(namecompany)
        question.check_copyright
      end
      question.check_limit
      break if inputvar == 2
    end
  end
  break if input == 2
end
end
break if inputz == 2
end

loop do
  puts %{
  	      press
          1 - for start survey
          2 - for show surveys
          3 - for delete survey
          4 - for show questions with variants
          5 - for delete Question
          6 - for delete variants
          7 - for print surveys counter id
          8 - for print questions counter id
          9 - for print variants counter id
          10 - for print answer counter id
          11 - for find (name) survey
          12 - for find (id) survey
          13 - run survey all
          14 - run survey first
          15 - run survey last
          16 - survey show company
          17 - for find (text) question
          18 - run question all
          19 - run question first
          20 - run question last
          21 - for find (text) variant
          22 - run variants all
          23 - run variants first
          24 - run variants last
          25 - question show company
          26 - variant show company
  }

  inp = gets.chomp.to_i

  case inp

  when 1

    puts 'start survey'
    arr_weights = []
    user.surveys.each do |survey|
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
    end
    answer = Answer.new
    user.surveys.each do |survey|
      survey.add_answer(answer)
    end
    sum = 0
    arr_weights.each do |weight|
      sum += weight
    end
    puts 'total weight of answers'
    puts sum

  when 2

    user.show_surveys

  when 3

    puts 'enter name of survey for delete'
    condition = gets
    user.delete_survey(condition)

  when 4

    user.show_questions_with_variants

  when 5

    puts 'enter text of question for delete'
    condition = gets
    survey.delete_question(condition)

  when 6

    puts 'enter text of variant for delete'
    condition = gets
    question.delete_variant(condition)

  when 7

    user.counter_surv_id

  when 8

    user.surveys.each do |survey|
      survey.counter_questions_id
    end

  when 9

    user.surveys.each do |survey|
      survey.questions.each do |question|
        question.counter_variants_id
      end
    end

  when 10

    user.surveys.each do |survey|
      survey.counter_answers_id
    end

  when 11

  	puts "print name of survey for find"
    name = gets
    puts Survey.find(name: name)

  when 12

  	puts "print id of survey for find"
    id = gets
    puts Survey.find(id: id)

  when 13

    puts Survey.all

  when 14

    puts Survey.first

  when 15

    puts Survey.last

  when 16

    user.surveys.each do |survey|
      survey.show_company
    end

  when 17

  	puts "print text of question for find"
    text = gets
    puts Question.find(text: text)

  when 18

    puts Question.all

  when 19

    puts Question.first

  when 20

    puts Question.last

  when 21

  	puts "print text of variant for find"
    text = gets
    puts Variant.find(text: text)

  when 22

    puts Variant.all

  when 23

    puts Variant.first

  when 24

    puts Variant.last

  when 25

    user.surveys.each do |survey|
      survey.questions.each do |question|
        question.show_company
      end
    end

  when 26

    user.surveys.each do |survey|
      survey.questions.each do |question|
        question.variants.each do |variant|
          variant.show_company
        end
      end
    end
  end
  redo
end