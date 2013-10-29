class HomeController < ApplicationController

	def index
		@message = "This is a message from controller"
		render :index
	end
end