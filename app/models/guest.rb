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
end
