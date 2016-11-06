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
  		return "http://welandross.com/rsvp?party_id=#{self.party_id}"
  	end

  	def rsvp_link_pt
  		return "http://welandross.com/rsvp?party_id=#{self.party_id}&language=Portuguese"
  	end

  	def self.portuguese
  		guests = []
  		Guest.all.each do |g|
			if g.language == "Portuguese"
				guests << g
			end
  		end
  		return guests
  	end

  	def self.english
  		guests = []
  		Guest.all.each do |g|
			if g.language == "English"
				guests << g
			end
  		end
  		return guests
  	end

	def self.to_csv_for_mailchimp_import_english
		attributes = %w{ first_name last_name email rsvp_link } 
		CSV.generate( { headers: true } ) do |csv|
		csv << attributes
			self.english.each do |guest|
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
	def self.to_csv_for_mailchimp_import_portuguese
		attributes = %w{ first_name last_name email rsvp_link_pt } 
		CSV.generate( { headers: true } ) do |csv|
		csv << attributes
			self.portuguese.each do |guest|
				if guest.email.present?
					csv << [ 
						guest.first_name || "N/A",
						guest.last_name || "N/A",
						guest.email || "N/A",
						guest.rsvp_link_pt || "N/A"
					]
				end	
			end 
		end
	end

  	def language
  		if self.country == "AO" || self.country == "PT" || self.country == "BE"
  			return "Portuguese"
  		else
  			return "English"
  		end
  	end

end



