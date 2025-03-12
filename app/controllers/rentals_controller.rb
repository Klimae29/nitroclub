class RentalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: [:create]

  def new
    @rental = Rental.new
  end

  def show

  end
  def create
    @rental = @car.rentals.build(rental_params)
    @rental.user = current_user
    @rental.owner = @car.user

    if @rental.save
      redirect_to dashboard_path, notice: 'Votre réservation a été effectuée.'
    else
      render 'cars/show', status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy

  end
  def accept
    @rental = Rental.find(params[:id])
    if @rental.owner == current_user && @rental.pending?
      @rental.update(status: :accepted)
      redirect_to dashboard_path, notice: 'La réservation a été acceptée.'
    else
      redirect_to dashboard_path, alert: 'Vous ne pouvez pas accepter cette réservation.'
    end
  end

  def reject
    @rental = Rental.find(params[:id])
    if @rental.owner == current_user && @rental.pending?
      @rental.update(status: :rejected)
      redirect_to dashboard_path, notice: 'La réservation a été rejetée.'
    else
      redirect_to dashboard_path, alert: 'Vous ne pouvez pas rejeter cette réservation.'
    end
  end

  private

  def set_car
    @car = Car.find_by(id: params[:car_id])
    redirect_to root_path, alert: 'Voiture introuvable' unless @car
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
