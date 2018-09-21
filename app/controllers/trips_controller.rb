class TripsController < ApplicationController

  def index
    trips = Trip.all
    render json: trips
  end

  def create
    trip = Trip.create(username: params[trips_params]) #or trips_params
    render json: trip
  end

  private

  def trips_params
    params.require(:trip).permit(:name, :country, :location, :things_did,
    :notes, :date_from, :date_to)
  end

end
