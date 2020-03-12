class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/tweets/#{@comment.tweet.id}", notice: "Thank-you your comment!!!"
    else
      render template: "tweet/show"
      flash.now[:alert] = "please add text."
    end
    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
