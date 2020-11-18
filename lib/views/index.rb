$:.unshift File.expand_path('./../lib/app', __FILE__)
require 'scrap'
$:.unshift File.expand_path('./../lib/views', __FILE__)
require 'done'

class Index
	def choice
		puts "Choose the format you like to export scrapped file: "
		puts " 1 - format JSON"
		puts " 2 - format CSV"
		puts " 3 - DONE !"
		# puts " 4 - format Google Spreadsheet"
		print "\n" + "Enter your choice here: " 

		# Get the choice
		choice = gets.chomp.to_i
		return choice
	end

	def get_data(choice)
		# New instance
		instance = Scrap.new
		# Get all data into a table
		instance.get_townhall_urls
		# In function of your choice, we will convert it in: 
			if choice == 1 then # JSON
				instance.save_as_json
				# puts Index.new.perform
				puts Done.new.perform
			# elsif choice == 4 then # SPREADSHEET
			# 	instance.save_as_spreadsheet
			# 	#puts Index.new.perform
			# 	puts Done.new.perform
			elsif choice == 2 then # CSV
				instance.save_as_csv
				# puts Index.new.perform
				puts Done.new.perform		
			end
	end

	def perform
		get_data(choice)
	end
end