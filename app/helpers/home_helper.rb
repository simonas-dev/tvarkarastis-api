module HomeHelper
  def is_admin
    user_signed_in? && !current_user.blank? && current_user.is_admin
  end
end
