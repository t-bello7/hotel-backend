class Api::V1::RoomsController < ApplicationController
  before_action :set_api_v1_room, only: %i[show update destroy]

  # GET /api/v1/rooms
  def index
    @api_v1_rooms = Room.all

    render json: @api_v1_rooms
  end

  # GET /api/v1/rooms/1
  def show
    render json: @api_v1_room
  end

  # POST /api/v1/rooms
  def create
    @api_v1_room = Room.new(api_v1_room_params)

    if @api_v1_room.save
      render json: @api_v1_room, status: :created, location: @api_v1_room
    else
      render json: @api_v1_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/rooms/1
  def update
    if @api_v1_room.update(api_v1_room_params)
      render json: @api_v1_room
    else
      render json: @api_v1_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/rooms/1
  def destroy
    @api_v1_room.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_room
    @api_v1_room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_room_params
    params.fetch(:api_v1_room, {})
  end
end
