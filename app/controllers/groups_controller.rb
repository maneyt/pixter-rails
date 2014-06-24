class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to :groups
    else 
      render :new
    end
  end

  def index
    @groups = Group.all
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
