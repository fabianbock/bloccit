require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do

     before do 
      
      @post = associated_post
      @user = authenticated_user
      sign_in @user
     end

     it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
     end
     
     it "returns the appropriate favorite if it exists" do
      post :create, { post_id: @post.id }
      expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil
     end

     it "returns `nil` if the user has favorited another post" do
      post :create, { post_id: @post.id }
 
      expect( @user.favorites.find_by_post_id(@post2.id) ).to be_nil
     end

   end
 end