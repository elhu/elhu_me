class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  def admin_user
    deny_access unless is_admin?
  end

  def deny_access
    redirect_to sign_in_path, :notice => "This page is for administrators only"
  end

  helper_method :is_admin?
  def is_admin?
    if signed_in? and current_user.admin?
      true
    else
      false
    end
  end
end
