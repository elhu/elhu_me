class SessionsController < Clearance::SessionsController
	def create
	  @user = authenticate(params)
	  if @user.nil?
	  	authentication_failure
	  else
	  	if @user.uses_openauthenticator? and not oa_authenticate(@user, params[:session][:oa_token])
	  		authentication_failure
	  	else
		    logger.debug("User signing in")
		    sign_in(@user)
		    logger.debug("User signed in")
	      redirect_back_or(url_after_create)
	    end
	  end
 	end

 	private
 		def authentication_failure
	    flash_failure_after_create
	    render :template => 'sessions/new', :status => :unauthorized
 		end
end
