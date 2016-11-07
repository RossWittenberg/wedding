class HomeController < ApplicationController
	layout "rsvp"

	def index
		
	end

	def rsvp
		if params[:party_id]
			@party = Party.includes(:guests).find(params[:party_id])
			@guests = @party.guests.sort { |a,b| a.first_name.downcase <=> b.first_name.downcase }
		end
		if params[:language] && params[:language] == "Portuguese"
			render "rsvp_pt"
		end	
	end

	def export_for_mailchimp_english
	    respond_to do |format|
			format.csv { send_data Guest.to_csv_for_mailchimp_import_english }
	    end
	end

	def to_csv_for_pary_update
	    respond_to do |format|
			format.csv { send_data Guest.to_csv_for_pary_update }
	    end
	end

	def export_for_mailchimp_portuguese
	    respond_to do |format|
			format.csv { send_data Guest.to_csv_for_mailchimp_import_portuguese }
	    end
	end
end