class CommentsController < ApplicationController
  # params = {
  #   topic_id: 1,
  #   post_id: 2,
  #   comment: {
  #     body: "this is the thing typed in the form"
  #   }
  # }
  # current_user = User.first
  def create
    # exchange params[:post_id] for an actual Post
    @post = Post.find(params[:post_id])
    # make a new unsaved Comment
    @comment = Comment.new
    
    authorize @comment
    # set the comment's body from params[:comment][:body]
    @comment.body = params[:comment][:body]
    # associate the comment with the post
    @comment.post = @post
    # associate the comment with the user
    @comment.user = current_user
    # save the comment
    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@post.topic, @post]
    end
    # redirect the requestor to the post's show page
    # redirect_to "/topics/#{@post.topic.id}/posts/#{@post.id}"
    # redirect_to topic_post_path(@post.topic.id, @post.id)
    # redirect_to topic_post_path(@post.topic, @post)
    
  end


  def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.topic, @post]
     end
     
   end

  

end
