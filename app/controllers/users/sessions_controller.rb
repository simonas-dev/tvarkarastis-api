# vartotoju prisijungimo valdiklis
class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: :login
  prepend_before_action :require_no_authentication, only: [:new, :login]
  prepend_before_action :allow_params_authentication!, only: :login
  prepend_before_action(only: [:login, :destroy]) { request.env["devise.skip_timeout"] = true }

  # vartotojo prisijungimo langas
  def new
    super
  end

  # vartotojo prisijungimas
  def login
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # vartotojo atsijungimas
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
