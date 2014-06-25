class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    current_user.groups << group

    redirect_to :groups
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.groups.destroy(group)

    redirect_to :groups
  end
end
