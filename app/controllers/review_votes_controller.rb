class ReviewVotesController < ApplicationController

  respond_to :json, :xml
  skip_before_filter :verify_authenticity_token
  skip_before_filter :require_login

  def new
    @review_vote = ReviewVote.new
  end

  def show
    @review_vote = ReviewVote.find(params[:id])
    render json: @review_vote
  end

  def index
    @reviews_votes = ReviewVote.all
    render json: @reviews_votes
  end

  def create
    @review_vote = ReviewVote.new(review_vote_params)
    respond_to do |format|
      if @review_vote.save
        format.json { render json: @review_vote, status: :created }
      else
        format.json { render json: @review_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def review_vote_params
    params.require(:review_vote).permit(:user_id, :review_id, :value)
  end

end
