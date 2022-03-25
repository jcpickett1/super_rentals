class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show update destroy ]

  # GET /rentals
  def index
    if params[:rental_id]
        @rental = Rental.where(rental_id: params[:rental_id])
        render json: { data: @rental }
    else
        p params
        @rentals = Rental.all
        render jsonapi: @rentals
    end
  end

  # GET /rentals/1
  def show
    @rental = Rental.where(rental_id: params[:rental_id])
    render json: @rental
  end

  # POST /rentals
  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      render json: @rental, status: :created, location: @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rentals/1
  def update
    if @rental.update(rental_params)
      render json: @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rentals/1
  def destroy
    @rental.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:id, :rental_id, :title, :owner, :city, :location, :category, :bedrooms, :image, :description)
    end
end
