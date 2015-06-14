class CommentsController < ApplicationController
<<<<<<< HEAD
   def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to @post, notice: "Post successful."
=======

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to @post, notice: "Comment successful."
>>>>>>> f0b5eb515fd89b0b3b5e695ea755d6d467768cda
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

<<<<<<< HEAD
    redirect_to @review, notice: "Post deleted."
=======
    redirect_to @post, notice: "Comment deleted."
>>>>>>> f0b5eb515fd89b0b3b5e695ea755d6d467768cda
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> f0b5eb515fd89b0b3b5e695ea755d6d467768cda
