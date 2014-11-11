include ActionView::Helpers::NumberHelper

RENTAL_TYPES = ["Apartment", "House", "Duplex", "Room", "Other"]

class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.create(rental_params)
    if @rental.save
      flash[:success] = "Listing created."
      redirect_to @rental
    else
      render 'new'
    end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    if @rental.authenticate(params[:rental][:passcheck])
      if @rental.update_attributes(rental_edit_params)
        flash[:success] = "Listing updated."
        redirect_to @rental
      else
        render 'edit'
      end
    else
      flash[:danger] = "Incorrect password."
      redirect_to @rental
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.authenticate(params[:rental][:passcheck])
      @rental.destroy
      flash[:success] = "Listing deleted!"
      redirect_to root_path
    else
      flash[:danger] = "Incorrect password."
      redirect_to @rental
    end
  end

  def index
    @listings = Rental.all
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.infowindow render_to_string partial: "rentals/infowindow", locals: { listing: listing }
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end

  private

    def rental_params
      params.require(:rental).permit(:rental_type, :price, :location, :city, :state, :zip, :beds, :bath, :pets,
                                     :utilities, :description, :gallery, :password, :password_confirmation,
                                     :email, :email_hidden, :phone)
    end

    def rental_edit_params
      params.require(:rental).permit(:rental_type, :price, :location, :city, :state, :zip, :beds, :bath, :pets,
                                     :utilities, :description, :gallery, :email, :email_hidden, :phone)
    end

end
