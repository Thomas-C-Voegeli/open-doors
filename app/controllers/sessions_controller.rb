class SessionsController < ApplicationController
	
	include SessionsHelper

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			log_in(user)
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end
