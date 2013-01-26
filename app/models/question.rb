class Question < ActiveRecord::Base
  attr_accessible :survey_id, :question_text

  belongs_to :survey
  has_many :responses

  validates :question_text, :survey_id, :presence => true


  def self.create_question(survey, question_text)
    q= Question.new
    q.survey, q.question_text = survey, question_text
    q.save
    q
  end

  def make_response
    choice = ""
    puts "How many choices will this question have?"
    print "> "
    number = gets.chomp.to_i
    number.times do |num|
      puts "Type what you would like to have as choice #{num+1}:"
      print "> "
      choice = gets.chomp if choice == ""
      response = Response.create(:choice => choice, :question_id => self.id)
      choice =""
    end
  end

end
