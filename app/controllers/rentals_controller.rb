RENTAL_TYPES = ["Apartment", "House", "Duplex", "Room", "Other"]

class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.create(rental_params)
    if @rental.save
      redirect_to @rental
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
    @rental = Rental.find(params[:id])
  end

  private

    def rental_params
      params.require(:rental).permit(:rental_type, :price, :location, :city, :state, :zip, :beds, :bath, :pets,
                                     :description, :gallery, :password, :password_confirmation)
    end
end
