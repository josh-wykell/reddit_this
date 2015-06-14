class CommentsController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to @post, notice: "Post successful."
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to @review, notice: "Post deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end