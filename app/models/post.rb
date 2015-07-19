class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_one :summary
  mount_uploader :image, ImageUploader

 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end

 def up_votes
  votes.where({value: 1}).count
 end

 def down_votes
  votes.where(value: -1).count
 end

 def points
  votes.sum(:value)
  # up_votes - down_votes
 end

 def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
     new_rank = points + age_in_days
 
     update_attribute(:rank, new_rank)
 end

  default_scope { order('rank DESC') }
  

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def save_with_initial_vote
    ActiveRecord::Base.transaction do
      @post = Post.new
      @post.save
      @post.create_vote
    end
  end

  def create_vote
    # This is the problem area where I need help
    @vote = current_user.votes.create(value: 1, post: self)
  end

end
