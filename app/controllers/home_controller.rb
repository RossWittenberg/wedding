class HomeController < ApplicationController
	layout "rsvp"

	def index
		
	end

	def rsvp
		Rails.logger.info "#{ params }"
		if params[:party_id]
			@party = Party.includes(:guests).find(params[:party_id])
			@guests = @party.guests.sort { |a,b| a.first_name.downcase <=> b.first_name.downcase }
		end

	end

	def export_for_mailchimp_english
	    respond_to do |format|
			format.csv { send_data Guest.to_csv_for_mailchimp_import_english }
	    end
	end

	def export_for_mailchimp_portuguese
	    respond_to do |format|
			format.csv { send_data Guest.to_csv_for_mailchimp_import_portuguese }
	    end
	end
end