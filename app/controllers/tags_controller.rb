class TagsController < ApplicationController
  def create #creates tag and image_tag 
    image = Image.find(params[:image_id])
    name_tags = tag_params[:name].split(",")
    for tag_name in name_tags
      tag = Tag.new(name: tag_name)
      if tag.save #if the tag doesn't already exist
        image.add_tag tag
      else 
        tag = Tag.where(name: tag_name).first #find the existing tag in the database
        image.add_tag tag
      end
    end
    
    redirect_to image
  end

  def show
    @tag = Tag.find(params[:id])
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
