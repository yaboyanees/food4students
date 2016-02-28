class Paygrade < ActiveRecord::Base
	#1-M relationship with adults
	belongs_to :adults
	
end
