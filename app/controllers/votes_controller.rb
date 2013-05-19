  class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  def show
    if session[:user_id].present?
      @vote = Vote.find_by_id(params[:id])
    else
      redirect_to new_session_url, notice: "you need to be signed in"
    end
  end

  def new
    @vote = Vote.new


  end

  def create
    @vote = Vote.new
    @vote.user_id = params[:user_id]
    @vote.movie_id = params[:movie_id]

    if @vote.save
            redirect_to votes_url
          else
      render 'new'
    end
  end

  def edit
      @vote = Vote.find_by_id(params[:id])
    if session[:user_id] != @vote.user_id
      redirect_to movies_url, notice: "this is not you"
    end
  end

  def update
    @vote = Vote.find_by_id(params[:id])
    @vote.user_id = params[:user_id]
    @vote.movie_id = params[:movie_id]

    if @vote.save
            redirect_to votes_url
          else
      render 'edit'
    end
  end

  def destroy
    @vote = Vote.find_by_id(params[:id])
    @vote.destroy
        redirect_to votes_url
      end
end
