class LikeGroupsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    Like.create(user_id: current_user.id, likeable: group)

    redirect_to group
  end

  def destroy
    group = Group.find(params[:group_id])
    like = Like.find_by(likeable_id: group.id, likeable_type: "Group")
    like.destroy

    redirect_to group
  end

end
