class Api::V0::UsersController < ApplicationController
  before_action :set_api_v0_user, only: %i[show update destroy]

  # GET /api/v0/users
  def index
    @api_v0_users = User.all

    render json: @api_v0_users
  end

  # GET /api/v0/users/1
  def show
    render json: @api_v0_user
  end

  # POST /api/v0/users
  def create
    @api_v0_user = User.new(api_v0_user_params)

    if @api_v0_user.save
      render json: @api_v0_user, status: :created, location: @api_v0_user
    else
      render json: @api_v0_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v0/users/1
  def update
    if @api_v0_user.update(api_v0_user_params)
      render json: @api_v0_user
    else
      render json: @api_v0_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v0/users/1
  def destroy
    @api_v0_user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v0_user
    @api_v0_user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v0_user_params
    params.fetch(:api_v0_user, {})
  end
end
