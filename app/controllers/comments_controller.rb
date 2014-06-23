class CommentsController < ApplicationController

  def create
    image = Image.find(params[:image_id])
    additional_params = {user_id: current_user.id, image_id: image.id}
    comment = image.comments.new(comment_params.merge(additional_params))
    comment.save
    redirect_to image
  end

  private 

  def comment_params
    params.require(:comment).permit(:text)
  end
end
