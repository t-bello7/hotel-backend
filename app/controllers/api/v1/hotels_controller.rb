class Api::V1::HotelsController < ApplicationController
  load_and_authorize_resource
  before_action :set_api_v1_hotel, only: %i[show update destroy]

  # GET /api/v1/users/:user_id/hotels
  def index
    @api_v1_hotels = Hotel.all

    render json: @api_v1_hotels.map { |hotel| HotelSerializer.new(hotel).serializable_hash[:data][:attributes] }
  end

  # GET /api/v1/hotels/1
  def show
    render json: HotelSerializer.new(@api_v1_hotel).serializable_hash[:data][:attributes]
  end

  # POST /api/v1/hotels
  def create
    @api_v1_hotel = @current_user.hotels.new(api_v1_hotel_params)

    if @api_v1_hotel.save
      render json: HotelSerializer.new(@api_v1_hotel).serializable_hash[:data][:attributes], status: :created
    else
      render json: @api_v1_hotel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/hotels/1
  def update
    if @api_v1_hotel.update(api_v1_hotel_params)
      render json: HotelSerializer.new(@api_v1_hotel).serializable_hash[:data][:attributes]
    else
      render json: @api_v1_hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/hotels/1
  def destroy
    render json: { deleted: 'deleted successfully!' } if @api_v1_hotel.destroy
  end

  private

  def set_api_v1_hotel
    @api_v1_hotel = Hotel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_hotel_params
    params.permit(:name, :location, :email, :phone_number, :image)
  end
end
