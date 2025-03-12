class RentalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: [:create]

  def create
    @car = Car.find(params[:car_id])
    @rental = @car.rentals.build(rental_params)
    @rental = Rental.new(rental_params)
    @rental.car = @car
    @rental.user = current_user  # L'utilisateur qui fait la réservation

    @rental.owner = @car.user   # Le propriétaire de la voiture

    if @rental.save
      redirect_to dashboard_path, notice: 'Votre réservation a été effectuée.'
    else
      render 'cars/show', alert: 'Impossible de créer la réservation.'
    end
  end

  def accept
    @rental = Rental.find(params[:id])
    @rental.update(status: :accepted)
    redirect_to dashboard_path, notice: 'La réservation a été acceptée.'
  end

  def reject
    @rental = Rental.find(params[:id])
    @rental.update(status: :rejected)
    redirect_to dashboard_path, notice: 'La réservation a été rejetée.'
  end

  def new
    @car = Car.find(params[:car_id])
    @rental = Rental.new
  end




  def show
  end

  def update
  end

  def destroy
  end

 private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
