module ApplicationHelper

  def admin_user?
    user_signed_in? && !current_user.blank? && current_user.is_admin
  end

end
