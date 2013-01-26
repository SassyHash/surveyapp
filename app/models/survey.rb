class Survey < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  belongs_to :creator, :class_name => "User", :foreign_key => "user_id"
  has_many :questions
  has_many :answers, :through => :responses
  has_many :respondents, :through => :answers, :source => :user_id

  validates :title, :creator, :presence => true

  def self.create_survey(user, title, description)
    new_survey = Survey.new
    new_survey.title, new_survey.description = title, description
    new_survey.creator = user # => new_survey.user_id = user.id
    # new_survey.creator.id #=> new_survey.user_id
    # new_survey.creator.id = user.id # because what if new_survey.creator is nil?

    # #new_survey.user_id = user.id

    new_survey.save!
    new_survey

  end

  def make_question
    puts "What would you like as your question?"
    print "> "
    text = gets.chomp
    Question.create_question(self, text)
  end

 
end
