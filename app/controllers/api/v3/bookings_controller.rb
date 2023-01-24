class Api::V3::BookingsController < ApplicationController
  before_action :set_api_v3_booking, only: %i[show update destroy]

  # GET /api/v3/bookings
  def index
    @api_v3_bookings = Booking.all

    render json: @api_v3_bookings
  end

  # GET /api/v3/bookings/1
  def show
    render json: @api_v3_booking
  end

  # POST /api/v3/bookings
  def create
    @api_v3_booking = Api::V3::Booking.new(api_v3_booking_params)

    if @api_v3_booking.save
      render json: @api_v3_booking, status: :created, location: @api_v3_booking
    else
      render json: @api_v3_booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v3/bookings/1
  def update
    if @api_v3_booking.update(api_v3_booking_params)
      render json: @api_v3_booking
    else
      render json: @api_v3_booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v3/bookings/1
  def destroy
    @api_v3_booking.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v3_booking
    @api_v3_booking = Api::V3::Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v3_booking_params
    params.fetch(:api_v3_booking, {})
  end
end
