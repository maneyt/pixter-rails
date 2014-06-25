class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    current_user.join group

    redirect_to :groups
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.leave group

    redirect_to :groups
  end
end
