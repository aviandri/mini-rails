require "action_controller"
require "app/controllers/application_controller"

# class Object
# 	def self.const_missing(name)
# 		file_name = name
# 		require file_name
# 		const_get name
# 	end
# end

class Application

	def call(env)
		request = Rack::Request.new(env) 
		response = Rack::Response.new

		controller_name, action_name = route(request.path_info)

		controller_class = load_controller_class(controller_name)
		controller = controller_class.new
		controller.request = request
		controller.response = response
		controller.process(action_name)

		response.finish
	end


	def route(path)
		_, controller, action = path.split("/")
		[controller || "home", action || "index"]
	end

	def load_controller_class(name)
		require "app/controllers/#{name}_controller"
		Object.const_get name.capitalize + "Controller" # "HomeController" => HomeController
	end

end