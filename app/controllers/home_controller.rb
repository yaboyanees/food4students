class HomeController < ApplicationController

  def index
  	if params[:rank].present? && params[:year].present?
  		@result = Paygrade.select("pay").where(["rank LIKE ?", "%#{params[:rank]}%"]).where(["year LIKE ?", "%#{params[:year]}%"])
  	else 
  	end
  	@ranks = Paygrade.uniq.pluck("rank")
  	@years = Paygrade.uniq.pluck("year")
  end

end