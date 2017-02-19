require 'beermapping_api'

class PlacesController < ApplicationController
  def index
  end
  
  def show
    Rails.cache.read(Place.find(:id).render_city)
    @place = Place.find(params[:id])
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end
  
  private
  def place_params
    params.require(:place).permit(:id, :status, :street, :city, :zip, :country, :overall)
  end
end