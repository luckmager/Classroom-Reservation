class AdminController < ApplicationController
	def show
		render template: "admin/#{params[:page]}"
	end
end
