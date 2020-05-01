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