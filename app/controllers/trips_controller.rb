class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
    render json: @trips
  end

  # POST /trips
  def create
    @trip = Trip.create(trips_params)
    if @trip.valid?
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
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
    # byebug
    @trip.update(trips_params)
    if @trip.valid?
      render json: @trip
    else
      render json: trip.errors, status: :unprocessable_entity
      #render json: { error: "Could not update the trip" }
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
  end

# PATCH/PUT /lists/1
# def update
#   if list.update(list_params)
#     render json: list
#   else
#     render json: list.errors, status: :unprocessable_entity
#   end
# end

# PATCH/PUT /trips/1
# PATCH/PUT /trips/1.json
# def update
#   respond_to do |format|
#     if @trip.update(trip_params)
#       format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
#       format.json { render :show, status: :ok, location: @trip }
#     else
#       format.html { render :edit }
#       format.json { render json: @trip.errors, status: :unprocessable_entity }
#     end
#   end
# end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trips_params
    # params.fetch(:trip, {})
    params.require(:trip).permit(:id, :name, :country, :location, :things_did,
    :notes, :date_from, :date_to, :user_id)
  end

end


# def create
#   trip = Trip.new(trips_params)
#   if trip.save
#     # serialized_data = ActiveModelSerializers::Adapter::Json.new(
#     #   TripSerializer.new(trip)
#     # ).serializable_hash
#     render json: trip
#   end
# end

 #render json: { status: 1, result: UserSerializer.new(user).as_json }
