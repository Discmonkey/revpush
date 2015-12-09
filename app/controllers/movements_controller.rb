class MovementsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @movement = current_user.movements.build(movement_params)
    if @movement.save
      flash[:success] = "Movement created!"
      redirect_to current_user
    else
      flash[:warning] = "Please make sure both the movement name and description are filled in"
      @movement = Movement.new
      @movement.center_lat = params[:center_lat]
      @movement.center_long = params[:center_long]
      render 'movements/new'
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
      lat=location[0].latitude
      long=location[0].longitude
      @circles_json = "[{\"lng\": #{long}, \"lat\": #{lat}, \"radius\": 1000000},\"editable\":true]"
      @movement.center_lat = lat
      @movement.center_long = long
    end
  end

  def show
  end

  def destroy
  end

  private
    def movement_params
      params.permit(:name, :desc, :zoom, :center_lat, :center_long, :movement_color, :movement_strength, :Address)
    end
end
