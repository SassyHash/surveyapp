class User < ActiveRecord::Base
  attr_accessible :screen_name, :email_address
  has_many :surveys
  has_many :responses
end
