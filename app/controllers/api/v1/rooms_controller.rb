class Api::V1::RoomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_api_v1_room, only: %i[show update destroy]
  before_action :set_api_v1_hotel, only: %i[index]

  # GET /api/v1/hotel/:hotel_id/rooms
  def index
    @api_v1_rooms = @api_v1_hotel.rooms

    render json: @api_v1_rooms.map { |room| HotelSerializer.new(room).serializable_hash[:data][:attributes] }
  end

  # GET /api/v1/users/1
  def show
    render json: RoomSerializer.new(@api_v1_room).serializable_hash[:data][:attributes]
  end

  # POST /api/v1/hotel/:hotel_id/rooms
  def create
    @api_v1_room = Room.new(api_v1_room_params)

    if @api_v1_room.save
      render json: RoomSerializer.new(@api_v1_room).serializable_hash[:data][:attributes], status: :created
    else
      render json: @api_v1_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/rooms/1
  def update
    if @api_v1_room.update(api_v1_room_params)
      render json: RoomSerializer.new(@api_v1_room).serializable_hash[:data][:attributes]
    else
      render json: @api_v1_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/rooms/1
  def destroy
    render json: { deleted: 'deleted successfully!' } if @api_v1_room.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_room
    @api_v1_room = Room.find(params[:id])
  end

  def set_api_v1_hotel
    @api_v1_hotel = Hotel.find(params[:hotel_id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_room_params
    params.permit(:name, :room_type, :bed_count, :price, :reserved, :number, :hotel_id, :image)
  end
end
