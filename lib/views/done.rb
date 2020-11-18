$:.unshift File.expand_path('./../lib/app', __FILE__)
require 'scrap'

class Done
	def perform
		puts "Thank you for using the app"
	end
end