# Start with: shotgun -I. -Ilib

class App
	def call(env)
		[
			200,
			{'Content-Type' => 'text/plain'},
			["you requested" + env["PATH_INFO"]]
		]
	end
end


class Logger
	def initialize(app)
	  @app = app
	end

	def call(env)
		puts "Calling "+ env["PATH_INFO"]
		@app.call(env)
	end
end

use Logger
run App.new

# require "application"

# run Application.new