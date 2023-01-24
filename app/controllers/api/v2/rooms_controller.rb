class Api::V2::RoomsController < ApplicationController
  before_action :set_api_v2_room, only: %i[show update destroy]

  # GET /api/v2/rooms
  def index
    @api_v2_rooms = Room.all

    render json: @api_v2_rooms
  end

  # GET /api/v2/rooms/1
  def show
    render json: @api_v2_room
  end

  # POST /api/v2/rooms
  def create
    @api_v2_room = Room.new(api_v2_room_params)

    if @api_v2_room.save
      render json: @api_v2_room, status: :created, location: @api_v2_room
    else
      render json: @api_v2_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/rooms/1
  def update
    if @api_v2_room.update(api_v2_room_params)
      render json: @api_v2_room
    else
      render json: @api_v2_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/rooms/1
  def destroy
    @api_v2_room.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v2_room
    @api_v2_room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v2_room_params
    params.fetch(:api_v2_room, {})
  end
end
