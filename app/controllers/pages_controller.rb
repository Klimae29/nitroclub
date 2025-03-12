class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def dashboard
    if current_user
      @current_rental = current_user.rentals.where("start_date <= ? AND end_date >= ?", Date.today, Date.today).first
      @past_rentals = current_user.rentals.where("end_date < ?", Date.today) || []  # Assurer que c'est un tableau vide si aucun résultat
      @rentals_as_owner = current_user.rentals_as_owner || []  # Assurer que c'est un tableau vide si aucun résultat
    else
      flash[:alert] = "Vous devez être connecté pour voir votre dashboard."
      redirect_to root_path
    end
  end

  def accept_rental
    @rental = Rental.find(params[:id])
    if @rental.owner == current_user && @rental.pending?
      @rental.update(status: :accepted)
      redirect_to dashboard_path, notice: 'Réservation acceptée.'
    else
      redirect_to dashboard_path, alert: 'Vous ne pouvez pas accepter cette réservation.'
    end
  end

  def reject_rental
    @rental = Rental.find(params[:id])
    if @rental.owner == current_user && @rental.pending?
      @rental.update(status: :rejected)
      redirect_to dashboard_path, notice: 'Réservation rejetée.'
    else
      redirect_to dashboard_path, alert: 'Vous ne pouvez pas rejeter cette réservation.'
    end
  end
end
