class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
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

  private
    def tweet_params
      params.require(:tweet).permit(:lyric, :artist, :link, :text, :song_name)
    end
end
