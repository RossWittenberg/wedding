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
  	
end