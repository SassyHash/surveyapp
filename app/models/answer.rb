class Answer < ActiveRecord::Base
  attr_accessible :choice, :question_id

  belongs_to :question
  has_many :responses
end
