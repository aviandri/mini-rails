require "rendering"

module ActionController
	class Base
		include Rendering
		attr_accessor :request, :response

		def process(action)
			send action
		end
	end
	
end