class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to "/tweets/#{@like.tweet.id}"
  end

  def destroy
    @like = Like.find_by(tweet_id: params[:tweet_id],user_id: current_user.id)
    @like.destroy
    redirect_to "/tweets/#{@like.tweet.id}"
  end

  private
  def like_params
    params.permit().merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
