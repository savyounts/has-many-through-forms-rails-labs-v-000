class CommentsController < ApplicationController

  def create
    binding.pru
    if !params[:comment][:user_id].empty?
      @comment = Comment.create(comment_params(:content, :post_id, :user_id))
    else
      @user = User.create(username: params[:comment][:user_attributes][:username])
      @comment = Comment.create(comment_params(:content, user_attributes => [:username], :post_id)) 
    end 
      redirect_to post_path(comment.post)
  end



  # def create 
  #   if !params[:comment][:user_id].empty? 
  #     @user = User.find(params[:comment][:user_id]) 
  #     @comment = Comment.create(content: params[:comment][:content], user_id: @user.id, post_id: params[:comment][:post_id]) 
  #   elsif  params[:comment][:user_id].empty? 
  #     @user = User.new(username: params[:comment][:user_attributes][:username]) 
  #     @user.save 
  #     @comment = Comment.create(content: params[:comment][:content], user_id: @user.id, post_id: params[:comment][:post_id]) 
  #   end 
  #   redirect_to post_path(params[:comment][:post_id])  
  # end

  private

    def comment_params(*args)
      params.require(:comment).permit(*args)
    end
end
end
