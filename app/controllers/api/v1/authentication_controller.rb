class Api::V1::AuthenticationController < ApplicationController
  # frozen_string_literal: true

  skip_before_action :authenticate_request

  # POST authentication/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M") }, status: :created
    else
      render json: { error: 'Invalid credentials!' }, status: :unauthorized
    end
  end
end
