class User < ActiveRecord::Base
  attr_accessible :screen_name, :email_address
  has_many :surveys
  has_many :answers

  validates :screen_name, :presence => true
  validates :email_address, :presence => true

  #   User.create(:screen_name => "ruggeri", :email_address => "ned@appacademy.io")

  def make_survey
    puts "What would you like as your survey's title? (mandatory)"
    print "> "
    title = gets.chomp
    puts "How would you describe your survey? (optional)"
    print "> "
    description = gets.chomp
    Survey.create_survey(self, title, description)
  end

  def ask_user_for_survey
    puts "What survey would you like to answer?"
    surveys = Survey.all
    surveys.each_with_index do |survey, i|
      print "#{i.to_s.rjust(2, '0')}:"
      print " #{survey.title}"
      puts
    end
    puts "> "
    index = (gets.chomp.to_i) +1
    s = Survey.find(index)
  end

  def choose_survey
    s = ask_user_for_survey

    if s.creator = self
      print "You made this survey. Pick another!"
      ask_user_for_survey
    end

    s.questions do |question|
      question.responses.each do |response|
        answers = response.answers
        answers.each do |answer|
          if answer.user_id == self.id
            puts "You've answered this survey."
            ask_user_for_survey
          end
        end
      end
    end

    answer_survey(s)
  end

  def answer_survey(survey)
    questions = Question.where(:survey_id => survey.id)
    questions.each_with_index do |question, index|
      puts "Question #{index+1}: #{question.question_text}"
        responses = Response.where(:question_id => question.id)
        responses.each_with_index do |response, index|
          puts "Choice #{index+1}: #{response.choice}"
        end
        print "> "
        answer = (gets.chomp.to_i)-1
      answer_question(responses[answer])
    end
  end

  def answer_question(response)
    Answer.create(:user_id => self.id, :response_id => response.id)
  end

end

