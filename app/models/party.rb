class Party < ActiveRecord::Base
  	has_many :guests, dependent: :destroy

	def self.update_details
		self.all.each do |party|
			party_guest = party.guests.select { |e| e.is_child? == false  }.first
			party.update({
				street_address_line_1: party_guest.street_address_line_1,
				street_address_line_2: party_guest.street_address_line_2,
				city: party_guest.city,
				state: party_guest.state,
				zip_code: party_guest.zip_code,
				country: party_guest.country,
				phone_number: party_guest.phone_number,
				invite_sent: party_guest.invite_sent
			})
		end
  	end

  	def language
  		if self.country == "AO" || self.country == "PT" || self.country == "BE"
  			return "Portuguese"
  		else
  			return "English"
  		end
  	end

  	def someone_is_attending?
  		guests = self.guests
  	end

  	def self.set_custom_greeting
		self.all.each do |party|
			adult_guests = party.guests.select { |guest| guest.is_child? == false }
			if party.language == "Portuguese"
				greeting_string = []
				adult_guests.each_with_index do |guest, i|	
					if i == 0	
						greeting_string << "OLA " 
					end	
						greeting_string << guest.first_name.upcase + " "
					if i == 0 && adult_guests.count > 1
						greeting_string << "& " 
					end
				end
				greeting_string = greeting_string*""
				party.update({
					custom_greeting: (greeting_string).chomp(" ") + "!"
				})
			else
				greeting_string = []
				adult_guests.each_with_index do |guest, i|	
					if i == 0	
						greeting_string << "HI " 
					end	
						greeting_string << guest.first_name.upcase + " "
					if i == 0 && adult_guests.count > 1
						greeting_string << "& " 
					end
				end	
				greeting_string = (greeting_string*"").chomp(" ") + "!"

				party.update({
					custom_greeting: greeting_string
				})
			end
		end
  	end
end


