class HomeController < ApplicationController
	layout "rsvp"
	def index

	end
	
	def english
	end

	def portuguese
	end

	def look_up_by_email
		if params[:email_address]
			@guest = Guest.find_by email: params[:email_address]
			if @guest
				@language = @guest.language
				if @language == "English"
					@lang_url = "en"
				else
					@lang_url = "pt"
				end
				@party = @guest.party
				redirect_to "/rsvp?party_id=#{@party.id}&language=#{@lang_url}"
			else
				@error = "Oops! Try again! / "
				render json: {error: @error}
			end
		end
	end

	def rsvp
		if params[:party_id]
			@party = Party.includes(:guests).find(params[:party_id])
			@guests = @party.guests.sort { |a,b| a.first_name.downcase <=> b.first_name.downcase }
		end
		if params[:language] && params[:language] == "pt" 
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


g = Guest.create({
	email: "mina.li@camutogroup.com",
	first_name: "Lina",
	last_name: "",
	country: "US",
	party: p,
	party_name: p.party_name
})

p = Party.create({
	party_name: "Lina",
	country: "US"
})

