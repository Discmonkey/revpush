class MovementsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @movement = current_user.movements.build(movement_params)
    if @movement.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def show
  end

  def destroy
  end
end
