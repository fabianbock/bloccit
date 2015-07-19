class FavoritesController < ApplicationController

  def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
     authorize favorite
     
     if favorite.save
      flash[:notice] = "Post is now a favorite!"
      redirect_to [post.topic, post]
     else
      flash[:error] = "There was an error favoriting the post. Please try again."
      redirect_to [post.topic, post]
     end
      
   end

   def destroy
      post = Post.find(params[:post_id])# Get the post from the params
      favorite = current_user.favorites.find(params[:id])# Find the current user's favorite with the ID in the params
      authorize favorite
    if favorite.destroy
      flash[:notice] = "Post has been unfavorited"
      redirect_to [post.topic, post]  # Flash success and redirect to @post
    else
     flash[:error] = "There was an error unfavoriting the post. Please try again."
     redirect_to [post.topic, post] # Flash error and redirect to @post
    end
 end

end
