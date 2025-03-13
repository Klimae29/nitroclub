class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]

  # GET /cars
  def index
    per_page = params[:per_page] || 50
    @q = Car.ransack(params[:q]) # Ransack pour filtrer
    style_filter = params.dig(:q, :style_eq)&.downcase # Convertir en minuscule

    style_filter = params.dig(:q, :style_eq)&.downcase
    @cars = @q.result
              .where("LOWER(style) = LOWER(?)", style_filter)
              .order(created_at: :desc)
              .page(params[:page])
              .per(per_page)
  end


  # GET /cars/new
  def new
    @car = Car.new
  end

  # POST /cars
  def create
    @car = current_user.cars.new(car_params)

    if @car.save
      redirect_to car_path(@car), notice: "Voiture ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /cars/:id
  def destroy
    if @car
      @car.destroy
      redirect_to cars_path, notice: "Voiture supprimée avec succès."
    else
      redirect_to cars_path, alert: "Voiture introuvable."
    end
  end

  private

  def set_car
    @car = Car.find_by(id: params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :style, :price, :year, :description, :image)
  end
end
