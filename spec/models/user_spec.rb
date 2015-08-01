require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      user = authenticated_user
      post = associated_post
      expect(user.favorited(post)).to(eq(nil))
    end

    it "returns the favorite when the user has favorited the post" do
      user = authenticated_user
      post = associated_post
      favorite = Favorite.create!(user: user, post: post)
      expect(user.favorited(post)).to eq(favorite)
    end
  end
end
