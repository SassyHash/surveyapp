class Question < ActiveRecord::Base
  attr_accessible :poll_id, :question_text

  belongs_to :survey
  has_many :responses, :through => :answers
  has_many :answers
end
