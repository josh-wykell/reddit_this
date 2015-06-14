class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end 

  def create
    @post = current_user.posts.create(post_params)

      if @post.save
        redirect_to @post, notice: 'Post Added'
      else 
        render :new
      end
  end

  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end  

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post Deleted'
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.downvoted_posts.include?(@post)
      current_user.downvoted_posts.delete(@post)
      current_user.upvotes.create(:post => @post)
    else
      current_user.upvotes.create(:post => @post)
    end
  end

  def downvote
    @post = Post.find(params[:id])
    if current_user.upvoted_posts.include?(@post)
      current_user.upvoted_posts.delete(@post)
      current_user.downvotes.create(:post => @post)
    else
      current_user.downvotes.create(:post => @post)
    end
  end

  private

  def set_post
    @post = current_user.post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :url, :title, :description )
  end
end
