class LikeGalleriesController < ApplicationController
  def create
    gallery = Gallery.find(params[:gallery_id])
    Like.create(user_id: current_user.id, likeable: gallery)
    redirect_to gallery
  end
  
  def destroy
    gallery = Gallery.find(params[:gallery_id])
    like = Like.find_by(likeable_id: gallery.id, likeable_type: "Gallery")
    like.destroy

    redirect_to gallery
  end
end
