class FollowsController < ApplicationController 
  def create
    followed_user = User.find(params[:user_id])
    follow = Follow.create({ user_id: current_user.id, followed_id: followed_user.id} )
    redirect_to :users
  end
end
