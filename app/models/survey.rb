class Survey < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  belongs_to :creator, :class_name => "User", :foreign_key => "user_id"
  has_many :questions
  has_many :respondents, :class_name => "Response", :foreign_key => "user_id"
  # has_many :respondents, :through => :responses, :sources => :user_id

end
