class TripsController < ApplicationController

  def index
    trips = Trip.all
    render json: trips
  end

  def create
    trip = Trip.create(trips_params)
    render json: trip
  end

  def update
    trip = trip.update(trips_params)
    render json: trip
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

  def trips_params
    params.require(:trip).permit(:name, :country, :location, :things_did,
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
