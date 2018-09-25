class CommentsController < ApplicationController

  def create 
    if !params[:comment][:user_id].empty? 
      @user = User.find(params[:comment][:user_id]) 
      @comment = Comment.create(comment_params(:content, :post_id, :user_id, user_attributes:[:username])) 
    else
      @user = User.new(username: params[:comment][:user_attributes][:username]) 
      @user.save 
      @comment = Comment.create(comment_params(:content, :post_id, :user_id, user_attributes:[:username], user_id: @user.id )) 
    end 
    redirect_to post_path(params[:comment][:post_id])  
  end

  private

    def comment_params(*args)
      params.require(:comment).permit(*args)
    end
end
