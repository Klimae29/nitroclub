require 'cloudinary'
class CarsController < ApplicationController
  def index
    @cars = Car.order(created_at: :desc).page(params[:page]).per(30)
    @cars_images = Cloudinary::Api.resources(type: :upload, prefix: "nitroclub/cars")["resources"]
    respond_to do |format|
    format.html
    format.js
    end
  end

  def show
    @car = Car.find_by(id: params[:id])

    if @car.nil?
    redirect_to cars_path, alert: "La voiture demandée n'existe pas."
    end
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
    @car = Car.find_by(id: params[:id])
    if @car
      @car.destroy
      redirect_to cars_path, notice: 'Voiture supprimée avec succès.'
    else
      redirect_to cars_path, alert: 'Voiture introuvable.'
    end
  end

private

  def car_params
    params.require(:car).permit(:name, :style, :price, :year, :description, :image)
  end
end
