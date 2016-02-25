class Household < ActiveRecord::Base
	#1-M relationship with Child
	has_many :children
	
	#1-M relationship with Adult
	has_many :adults
	
	#1-M relationship with Optional Info
	has_many :optionals

	#update adult table from household form	
	accepts_nested_attributes_for :adults, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
	
	#update child table from household form	
	accepts_nested_attributes_for :children, :reject_if => lambda { |c| c[:name].blank? }, :allow_destroy => true
	
	#update optional table from household form
	accepts_nested_attributes_for :optionals

 	#save city & state before saving record
	before_save :zipConvert


	#convert zipcode to city & state
 	def zipConvert
		if self.zip.present?
			zip = self.zip.to_s 
			self.city = zip.to_region(city: true) 
			self.state = zip.to_region(state: true)
			return city, state
		end		
 	end
 
 	#hold address in one object for call in view
   	def location
  		a = city.to_s
  		b = state.to_s
  		c = zip.to_s
  		return a + " " + b + ", " + c 
  	end
  	
	#titleize filler name
	def fillerName
		a = self.filler_name
		b = a.downcase
		c = b.titleize
		return c
	end
  
end
