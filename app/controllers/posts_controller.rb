class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    #@post = Post.all
    @post = Post.page(params[:page]).order(votes_count: :desc).per(5)
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

  # def upvote
  #   @post = Post.find(params[:id])
  #   @post.votes.create
  #   redirect_to(posts_path)
  # end

  # def downvote
  #   @post = Post.find(params[:id])
  #   @post.votes.delete
  #   redirect_to(posts_path)
  # end

  def upvote
    @post = Post.find(params[:id])
    current_user.voted_posts << @post
    # @bookmark = Bookmark.find(params[:id])
    # current_user.favorite_bookmarks << @bookmark
    redirect_to posts_url, notice: 'upvoted'
  end

  def downvote
    @post = Post.find(params[:id])
    current_user.voted_posts.delete(@post)
    # @bookmark = Bookmark.find(params[:id])
    # current_user.favorite_bookmarks.delete(@bookmark)
    redirect_to posts_url, notice: 'downvoted'
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :url, :title, :description )
  end
end
