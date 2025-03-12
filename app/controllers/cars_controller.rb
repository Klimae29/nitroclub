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
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # on ne le fait pas
  end

  def update
    # on ne le fait pas
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
  end

private

  def car_params
    params.require(:car).permit(:name, :style, :price, :year, :description, :image)
  end
end
