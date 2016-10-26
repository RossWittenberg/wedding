class HomeController < ApplicationController
	layout "rsvp", :except => [:index]

	def index
		
	end

	def rsvp
		if params[:party_id]
			@party = Party.find(params[:party_id])
		end
	end
end