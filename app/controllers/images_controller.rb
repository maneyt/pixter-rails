class ImagesController < ApplicationController 
  def new
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new(image_params)
    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
    if @image.update(image_params)
      redirect_to @gallery 
    else
      render :edit
    end
  end

  def destroy
    gallery = current_user.galleries.find(params[:gallery_id])
    image = gallery.images.find(params[:id])
    image.destroy
    redirect_to gallery
  end

  private 

  def image_params
    params.
      require(:image).permit(:url).merge(gallery_id: params[:gallery_id])
  end
end
