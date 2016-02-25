module ApplicationHelper
	
	#show yes/no in place of true/false
	def human_boolean(boolean)
		boolean ? 'Yes' : 'No'
	end

end

