class LikesController < ApplicationController
  def create
    image = Image.find(params[:image_id])
    
    Like.create(user_id: current_user.id, likeable: image)
    redirect_to image
  end

  def destroy
    image = Image.find(params[:image_id])
    like = Like.find_by(likeable_id: image.id, likeable_type: "Image")
    like.destroy
    redirect_to image
  end
end
