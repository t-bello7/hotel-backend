class Api::V1::BookingsController < ApplicationController
  before_action :set_api_v1_booking, only: %i[show update destroy]

  # GET /api/v1/bookings
  def index
    @api_v1_bookings = @current_user.bookings

    render json: @api_v1_bookings
  end

  # GET /api/v1/bookings/1
  def show
    render json: @api_v1_booking
  end

  # POST /api/v1/bookings
  def create
    @api_v1_booking = Booking.new(api_v1_booking_params)
    @api_v1_booking.user_id = @current_user.id
    if @api_v1_booking.save
      render json: @api_v1_booking, status: :created
    else
      render json: @api_v1_booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/bookings/1
  def update
    if @api_v1_booking.update(api_v1_booking_params)
      render json: @api_v1_booking
    else
      render json: @api_v1_booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bookings/1
  def destroy
    render json: { deleted: 'deleted successfully!' } if @api_v1_booking.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_booking
    @api_v1_booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_booking_params
    params.permit(:days, :booking_date, :amount, :user_id, :room_id, :hotel_id)
  end
end
