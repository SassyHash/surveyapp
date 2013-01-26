class Answer < ActiveRecord::Base
  attr_accessible :user_id, :response_id

  belongs_to :response
  belongs_to :respondents, :class_name => "User", :foreign_key => "user_id"

  validates :response_id, :respondents, :presence => true

end
