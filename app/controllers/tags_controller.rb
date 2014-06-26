class TagsController < ApplicationController
  def create
    image = Image.find(params[:image_id])
    tag_names = tag_params[:name].split(",")
    tag_names.each do |name|
      tag = Tag.find_or_create_by(name: name)
      image.add_tag tag
    end
    redirect_to image
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    image = Image.find(params[:image_id])
    tag = Tag.find(params[:id])
    image.untag tag
    redirect_to tag
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
