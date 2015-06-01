class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end
 
  default_scope { order('created_at DESC') }
  scope :ordered_by_title { where('title ASC') }
  scope :ordered_by_reverse_created_at { where('created_at ASC')}
end
