class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]

  # GET /cars
  def index
    per_page = params[:per_page] || 50
    @q = Car.ransack(params[:q])
    @cars = @q.result.order(created_at: :desc).page(params[:page]).per(per_page)

    if params[:q].present? && params[:q][:style_eq].present?
      style_filter = params[:q][:style_eq].downcase
      if style_filter == "all"
        @cars = Car.order(created_at: :desc).page(params[:page]).per(per_page)
      else
        @cars = @q.result
                  .where("LOWER(style) = ?", style_filter)
                  .order(created_at: :desc)
                  .page(params[:page])
                  .per(per_page)
      end
    else
      @cars = Car.order(created_at: :desc).page(params[:page]).per(per_page)
    end
    # filtrage par nom
    if params[:query].present?
      search_term = "%#{params[:query].downcase}%"
      @cars = @cars.where("LOWER(name) LIKE ?", search_term)
    end

    @cars ||= Kaminari.paginate_array([]) # ✅ Correction pour éviter le nil

    respond_to do |format|
      format.html
      format.js { render partial: "cars/list", locals: { cars: @cars } }
    end
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    @car.user = current_user
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
