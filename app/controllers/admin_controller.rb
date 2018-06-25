class AdminController < ApplicationController
	before_action :check_admin

	def show
		render template: "admin/#{params[:page]}"
	end

	# Check if current user is an admin
	def check_admin
		if current_user && current_user.role == 2
		elsif current_user && current_user.role != 2
			redirect_to buildings_url, notice: 'You are not authorized'
		else
			redirect_to buildings_url, notice: 'You are not logged in'
		end
	end
end
