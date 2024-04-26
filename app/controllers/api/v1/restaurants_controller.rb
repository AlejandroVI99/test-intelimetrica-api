class Api::V1::RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant
  end

  def create
    @restaurant = Restaurant.create(set_params)
    if !@restaurant.save
      render json: {
        status: 400,
        message: "error, rating not between 0 and 4 "
      }, status: :bad_request
    end
  end

  def update
    @restaurant.update(set_params)
    if !@restaurant.save
      render json: {
        status: 400,
        message: "error, rating not between 0 and 4 "
      }, status: :bad_request
    end
  end

  def destroy
    @restaurant.destroy
    head :ok
  end

  def statistics
    @statistics = Restaurant.statistics(
      params[:latitude],
      params[:longitude],
      params[:radius],
    )
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_params
    params.require(:restaurant).permit(
      :rating,
      :name,
      :site,
      :email,
      :phone,
      :street,
      :city,
      :state,
      :lat,
      :lng
    )
  end
end
