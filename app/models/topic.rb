class Topic < ActiveRecord::Base
  has_many :posts

  validates :title, length: { minimum: 5 }, presence: true
  
end
