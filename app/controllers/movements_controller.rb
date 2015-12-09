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

  def new
    place_name = params[:place]
    location = Geocoder.search(place_name)
    if location.empty?
      flash[:warning] = "Please enter valid Location"
      redirect_to current_user
    else
      @movement = Movement.new
      @movement.center_lat = location[0].latitude
      @movement.center_long = location[0].longitude
    end
  end

  def show
  end

  def destroy
  end
end
