class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
    render json: @trips
  end

  def user_trips
    if the_current_user
      trips = the_current_user.trips
      render json: trips
    else
      render json: {error: "No user?"}
    end
  end

  # POST /trips
  def create
    @trip = Trip.create(
      name: params[:name],
      location: params[:location],
      country: params[:country],
      things_did: params[:things_did],
      notes: params[:notes],
      date_from: (params[:date_from].to_time+1.day).strftime("%F"),
      date_to: (params[:date_to].to_time+1.day).strftime("%F"),
      user_id: params[:user_id]
    )
    if @trip.valid?
      render json: @trip
    else
      render json: { error: "*Something went wrong... Could not create trip" }
    end
  end

  # GET /trips/1
  def show
  end

  # GET /trips/1/edit
  def edit
  end

  # PATCH/PUT /trips/1
  def update     # using PUT instead of PATCH in api.js
    @trip.update(trips_params)
    if @trip.valid?
      render json: @trip
    else
      render json: { error: "Could not update trip" }
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trips_params
    params.require(:trip).permit(:id, :name, :country, :location, :things_did,
    :notes, :date_from, :date_to, :user_id)
  end

end
