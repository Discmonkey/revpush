class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    movement = Movement.find(params[:movement_id])
    current_user.join(movement)
    redirect_to movement
  end

  def destroy
    movement = Relationship.find(params[:id]).movement
    current_user.leave(movement)
    redirect_to movement
  end
end