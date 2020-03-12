class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: 'complete!!!'
    else
      flash.now[:alert] = 'failed, try again!'
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
    def tweet_params
      params.require(:tweet).permit(:lyric, :artist, :link, :text, :song_name).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
