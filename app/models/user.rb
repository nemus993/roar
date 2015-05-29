class User < ActiveRecord::Base
  has_many :users
  validates_confirmation_of :password
end
