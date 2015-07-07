class VotesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def create
  # @post = Post.find(params[:id])
    current_user.votes.create(vote_params)
    redirect_to :back, notice: 'upvoted'
  end

  def destroy
    # @post = Post.find(params[:id])
    current_user.votes.find_by(vote_params).destroy
    redirect_to :back, notice: 'downvoted'
  end

  private

  def vote_params
    params.require(:vote).permit(:voteable_id, :voteable_type)
  end
end