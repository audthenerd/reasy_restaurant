# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_user, only: :destroy

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @customer = Customer.find(current_customer.id)
    @customer.update(latitude: params[:customer][:latitude], longitude: params[:customer][:longitude])
    customer_session["latitude"] = params[:customer][:latitude]
    customer_session["longitude:"] = params[:customer][:longitude]
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:lat, :long])
  # end

end
