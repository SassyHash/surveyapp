class Response < ActiveRecord::Base
  attr_accessible :question_id, :user_id, :data

  has_one :respondent, :through => :users, :source => :user_id
  has_one :answer
  
end
