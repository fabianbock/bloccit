class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) {user ? all : publicly_viewable}

  # def self.visible_to(user)
  #   user ? all : publicly_viewable
  # end

  scope :publicly_viewable, -> {where(public: true)}
  scope :privately_viewable, -> {where(public: false)}

  validates :name, length: { minimum: 5 }, presence: true
  
  self.per_page = 50
end
