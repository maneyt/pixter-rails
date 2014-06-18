class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    #same as Gallery.create - saves it automatically
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to @gallery #"/galleries/#{gallery.id}"
    else 
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to @gallery #"/galleries/#{gallery.id}"
    else
      render :edit
    end
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to root_path # same as "/" generated by rails - shown in /rails/info/paths
  end

  private

  def gallery_params
    params.require(:gallery).permit(
      :name,
      :description,
    )
  end
end
