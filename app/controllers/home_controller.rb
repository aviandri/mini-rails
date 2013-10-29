class HomeController < ApplicationController

	def index
		response.writer "Hello from home controller"
	end
end