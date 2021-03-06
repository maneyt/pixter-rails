class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    @comment.image = @image

    if @comment.save
      redirect_to @image
    else
      @comments = @image.comments.recent
      render "/images/show"
    end 
  end

  private 

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
