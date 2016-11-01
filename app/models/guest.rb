class Guest < ActiveRecord::Base
	belongs_to :party
  	def status_string
  		if self.attending.blank? && self.attending == nil
  			return "might attend"
  		else 
	  		case self.attending?
	  		when true
	  			return "attending"
	  		when false
	  			return "not attending"
	  		end	
  		end
  	end
end
