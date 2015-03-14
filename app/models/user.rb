class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists
  has_many :user_subways
  has_many :subways, through: :user_subways

  #=> TODO validate zipcode as 5 digit int, presence of email
end
