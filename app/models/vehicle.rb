class Vehicle < ActiveRecord::Base

	def getVehicles
		require 'mechanize'

		agent = Mechanize.new
		page = agent.get('https://www.rbauction.com/rba-api/search/results/advanced?rbasq=YXJ8Tj00Mjk0MjM3MjUy&offset=0&count=48&ccb=USD')
		page = agent.get('https://www.rbauction.com/rba-api/search/results/advanced?rbasq=YXI3fE49NDI5NDIzNzI1Mg%3D%3D&offset=0&count=48&ccb=USD')

		# puts pp page

		# page.links.each do |link|
		#   puts link
		# end
	end

end
