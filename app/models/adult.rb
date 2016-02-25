class Adult < ActiveRecord::Base
	#M-1 relationship with household
	belongs_to :household

	#titleize each adult name
	def adultName
		a = self.name
		b = a.downcase
		c = b.titleize
		return c
	end
	
	#calculate pay total per adult
	def payCalc
		#pay total
		job = self.job ||= 0
		se = self.se ||= 0
		mil = self.mil ||= 0
		pay = job + se + mil

		#pca total
	  	pa = self.pa ||= 0
	  	cs = self.cs ||= 0
	  	ali = self.ali ||= 0
	  	pca = pa + cs + ali
	  	
	  	#pra total
      	pen = self.pen ||= 0
      	ret = self.ret ||= 0
	  	other = self.other ||= 0
	  	pra = pen + ret + other
	  	
	  	#total
	  	total = pay + pca + pra
	  	
	  	return pay, pca, pra, total 
	end
end
	
	  
	  	  
	  	