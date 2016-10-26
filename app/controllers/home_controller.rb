class HomeController < ApplicationController

	def index
		
	end

	def rsvp
		if params[:party_id]
			@party = Party.find(params[:party_id])
		end
	end
end