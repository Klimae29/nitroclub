class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def dashboard
    if current_user
      @current_rentals = current_user.rentals #.where("start_date <= ? AND end_date >= ?", Date.today, Date.today)
      @past_rentals = current_user.rentals.where("end_date < ?", Date.today) || []
      @rentals_as_owner = current_user.rentals_as_owner || []
    else
      flash[:alert] = "Vous devez être connecté pour voir votre dashboard."
      redirect_to root_path
    end
  end

#   def accept_rental
#     update_rental_status(:accepted, "Réservation acceptée.")
#   end

#   def reject_rental
#     update_rental_status(:rejected, "Réservation rejetée.")
#   end

#   private

#   def update_rental_status(new_status, message)
#     @rental = Rental.find_by(id: params[:id])
#     return redirect_to dashboard_path, alert: "Réservation introuvable." unless @rental

#     if @rental.owner == current_user && @rental.pending?
#       @rental.update(status: new_status)
#       redirect_to dashboard_path, notice: message
#     else
#       redirect_to dashboard_path, alert: "Vous ne pouvez pas modifier cette réservation."
#     end
#   end
end
