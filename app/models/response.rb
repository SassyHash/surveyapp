class Response < ActiveRecord::Base
  attr_accessible :choice, :question_id

  belongs_to :question
  has_many :answers

  validates :question_id, :choice, :presence => true

end
