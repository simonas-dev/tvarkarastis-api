class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def is_admin
    user_signed_in? && !current_user.blank? && current_user.is_admin
  end

end
