class HomeController < ApplicationController
	layout "rsvp", :except => [:index]

	def index
		
	end

	def rsvp
		if params[:party_id]
			@party = Party.includes(:guests).find(params[:party_id])
			@guests = @party.guests.sort { |a,b| a.first_name.downcase <=> b.first_name.downcase }
		end
	end
end