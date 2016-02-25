class AdminController < ApplicationController
  
  def index
    @households = Household.order("updated_at DESC")
    
    respond_to do |f|
      f.html
      f.xls
    end
  end

end
