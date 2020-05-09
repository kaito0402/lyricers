class UsersController < ApplicationController
  before_action :find_user
  def show
    @name = @user.name
    @tweets = @user.tweets
  end

  def like_show
    @name = @user.name
    @tweets = @user.liked_tweets
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
