class Api::V1::CarsController < ApplicationController  
  prepend_before_action :authenticate!

  def index
    render json: Car.select(:id, :name, :brand)
  end

  def create
    car = current_user.cars.create(car_params)

    render json: car, status: :created
  end

  protected

  def car_params
    params.require(:car).permit(:brand, :name)
  end
end  
