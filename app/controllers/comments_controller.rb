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
    # set the comment's body from params[:comment][:body]
    @comment.body = params[:comment][:body]
    # associate the comment with the post
    @comment.post = @post
    # associate the comment with the user
    @comment.user = current_user
    # save the comment
    @comment.save
    # redirect the requestor to the post's show page
    # redirect_to "/topics/#{@post.topic.id}/posts/#{@post.id}"
    # redirect_to topic_post_path(@post.topic.id, @post.id)
    # redirect_to topic_post_path(@post.topic, @post)
    redirect_to [@post.topic, @post]
  end
end
