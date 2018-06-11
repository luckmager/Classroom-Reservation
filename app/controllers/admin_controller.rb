class AdminController < ApplicationController
	before_action :check_admin

	def show
		render template: "admin/#{params[:page]}"
	end

	def check_admin
		if current_user && current_user.role == "admin"
		elsif current_user && current_user.role != "admin"
			redirect_to classrooms_url, notice: 'You are not authorized'
		else
			redirect_to classrooms_url, notice: 'You are not logged in'
		end
	end
end
