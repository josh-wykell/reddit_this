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
    @post = current_user.posts.create

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
    if @post.update(bookmark_params)
      redirect_to @post, notice: 'Bookmark was successfully updated.'
    else
      render :edit
    end
  end  

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post Deleted'
  end

  def vote
    @post = Post.find(params[:id])
    current_user.votes.create(:post => @post)
  end

  private

  def set_post
    @post = current_user.post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :url, :title, :description )
  end
end
