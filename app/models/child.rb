class Child < ActiveRecord::Base
	#M-1 relationship with household
	belongs_to :household
  	

 #split fullname into first, mi, last
 def nameSplit
	#firstname
	a = self.name.split(/\.?\s+/)
	first = a.first	
	#mi
	if a.last != a[1]
		b = a[1]
		c = b[0,1]
		middle = c + "."
	else
		middle = ""
	end	
	#lastname
	last = a.last
	
	#fullname
	fullname = first.downcase + " " + middle.downcase + " " + last.downcase
	
	return first.titleize, middle.titleize, last.titleize, fullname.titleize
  end


  #total pay calc by child  
  def payCalc
  	#pay
  	pay = self.pay ||= 0

  	#benefits
    ss  = self.ss ||= 0
    tru = self.tru ||= 0
    pen = self.pen ||= 0
    ann = self.ann ||= 0
    ben = ss + tru + pen + ann

    #spending money
    sm  = self.sm ||= 0

	#total pay    
    total = pay + ben + sm
    
    return pay, ben, sm, total 
  end
  
end
