class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @tweets = @user.tweets
  end

  def like_show
    @user = User.find(params[:id])
    @name = @user.name
    @tweets = @user.liked_tweets
  end
end
