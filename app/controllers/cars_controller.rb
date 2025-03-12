class CarsController < ApplicationController
  def index
    @cars = Car.order(created_at: :desc).page(params[:page]).per(30)

    respond_to do |format|
    format.html
    format.js
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
  end

  def edit
    # on ne le fait pas
  end

  def update
    # on ne le fait pas
  end

  def destroy
    @car= Car.find(params[:id])
    @car.destroy
  end

private

  def car_params
    params.require(:car).permit(:name, :style, :price, :year, :description, :photo)
  end
end
