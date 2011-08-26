class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  def admin_user
    deny_access unless is_admin?
  end

  def deny_access
    redirect_to sign_in_path, :notice => "This page is for administrators only"
  end

  def oa_authenticate(user, oa_token)
    base_url = "http://openauthenticator.elhu.me"
    credentials = { :account_token => user.account_token, :token => oa_token }
    logger.debug credentials.to_json
    authenticated = false
    begin
      res = RestClient.post "#{base_url}/authenticate.json", :credentials => credentials
    rescue Exception => e
      logger.debug e.to_json
    else
      authenticated = true if res.code == 200
    end
    logger.debug "Auth response: #{authenticated}."
    authenticated
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
