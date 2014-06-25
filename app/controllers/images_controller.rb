class ImagesController < ApplicationController 
  def new
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new(image_params.merge(gallery_id: @gallery.id))
    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @groups = Group.all
    @comments = @image.comments.recent
  end

  def edit
    @image = current_user.images.find(params[:id])
  end

  def update
    @image = current_user.images.find(params[:id])
    if @image.update(image_params)
      redirect_to @image.gallery
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
      require(:image).permit(:url, group_ids: [])
  end
end
