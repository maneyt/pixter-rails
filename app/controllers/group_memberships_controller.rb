class GroupMembershipsController < ApplicationController
  def create
    @group_membership = GroupMembership.new({user_id: current_user.id, group_id: params[:group_id] })
    @group_membership.save
    redirect_to :groups
  end

  def destroy
    group_membership = GroupMembership.find(params[:id])
    group_membership.destroy
    redirect_to :groups
  end
end
