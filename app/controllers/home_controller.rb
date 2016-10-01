class HomeController < ApplicationController

	def index
		@guests = Guest.all
	end

end