class Guest < ActiveRecord::Base
	belongs_to :party
  	def status_string
  		if self.attending.blank? && self.attending == nil
  			return "will let you know ASAP"
  		else 
	  		case self.attending?
	  		when true
	  			return "wouldn't miss it for the world"
	  		when false
	  			return "will be there in spirit"
	  		end	
  		end
  	end

  	def rsvp_link
  		return "http://rossandwel.com/home/rsvp?party_id=#{self.party_id}"
  	end

	def self.to_csv_for_mailchimp_import
		attributes = %w{ first_name last_name email rsvp_link } 
		CSV.generate( { headers: true } ) do |csv|
		csv << attributes
			self.all.each do |guest|
				if guest.email.present?
					csv << [ 
						guest.first_name || "N/A",
						guest.last_name || "N/A",
						guest.email || "N/A",
						guest.rsvp_link || "N/A"
					]
				end	
			end 
		end
	end

end



