class TweetsController < ApplicationController
 before_action :move_to_index, except: [:index, :show, :search]
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: 'completed!!!'
    else
      flash.now[:alert] = 'failed, try again!'
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path, notice: 'deleate completed!!!'
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @commentss = @tweet.comments.includes(:user)
    @comments = @commentss.reverse
    @like = Like.new
  end

  def search
    gon.signed_user = user_signed_in?
    @tweets = Tweet.search(params[:keyword]).includes(:user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:lyric, :artist, :link, :text, :song_name).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
      end
    end

