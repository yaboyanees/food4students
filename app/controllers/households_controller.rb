class HouseholdsController < ApplicationController
  #set household id for the following actions
  before_action :set_household, only: [:edit, :show, :update, :kids, :adults, :optionals, :thank_you]

  def index  	
  	if params[:rank].present? && params[:year].present?
  		@result = Paygrade.select("pay").where(["rank LIKE ?", "%#{params[:rank]}%"]).where(["year LIKE ?", "%#{params[:year]}%"])
  	else 
  	end
  	@pay = Paygrade.all
  	@ranks = Paygrade.order("rank").uniq.pluck("rank")
  	@years = Paygrade.uniq.pluck("year")

  	respond_to do |f|
  		f.html
  		f.js
  	end
  end
  
  def show
	@adult = Adult.new
	@child = Child.new
	@optional = Optional.new	

	@adults = @household.adults
	@children = @household.children
	@optionals = @household.optionals
	
    #calculate total household members
	@totalMembers = @adults.count(:id) + @children.count(:id)	

	#generate pdf
	respond_to do |f|
		f.html
		f.pdf do
		  render :pdf => "#{@household.filler_name}" + " " + "household",
				 :orientation => 'Landscape'
		end
	end	

  end

  def edit
  	@children = @household.children
	@adults = @household.adults  
	@optionals = @household.optionals
  end
  
  def new
    @household = Household.new
  end
  
  def thank_you
  end

  def kids
	@child = Child.new	
	@children = @household.children
	@adults = @household.adults  
	@optionals = @household.optionals
	@households = @household.present?
  end
  
  def adults
	@adult = Adult.new	
	@children = @household.children
	@adults = @household.adults  
	@optionals = @household.optionals	
	@households = @household.present?
	
  	if params[:rank].present? && params[:year].present?
  		@result = Paygrade.select("pay").where(["rank LIKE ?", "%#{params[:rank]}%"]).where(["year LIKE ?", "%#{params[:year]}%"])
  	else 
  	end
  	@pay = Paygrade.all
  	@ranks = Paygrade.order("rank").uniq.pluck("rank")
  	@years = Paygrade.uniq.pluck("year")
  end

  def optionals
	@optional = Optional.new
	@children = @household.children
	@adults = @household.adults  
	@optionals = @household.optionals
  end

  def create
    @household = Household.new(household_params)

    respond_to do |format|
      if @household.save
       	format.html { redirect_to edit_household_path(@household) }
      else
        format.html { redirect_to root_path }
      end
    end
  end


  def update
  	@households = @household.present?
  	
    respond_to do |format|
      if @household.update(household_params)    

        if @households && @household.children.present? && @household.status.nil?
        	format.html { redirect_to household_path(@household), flash: {notice: "Application Successfully Saved"} }
      	elsif @households.present? && @household.status.nil?
      		format.html { redirect_to kids_household_path(@household) }
		elsif @household.reviewed_by.nil? && @household.status.nil?
        	format.html { redirect_to (:back), flash: {notice: "Application Successfully Saved"} }      	
      	else
        	format.html { redirect_to (:back), flash: {notice: "Application Successfully Saved"} }
      	end
      
      end
    end
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household
      @household = Household.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def household_params
      params.require(:household).permit(:street, :city, :state, :zip, :phone, :email, :filler_name, :four, :signature, :casenum, :categorical, :status, :reviewed_by,
      adults_attributes:[:id, :name, :job, :cs, :ret, :pa, :pen, :ali, :se, :mil, :other, :household_id], 
      children_attributes:[:id, :name, :student, :foster, :hmr, :hs, :pay, :ss, :tru, :pen, :ann, :sm, :household_id],
	  optionals_attributes:[:id, :hl, :indy, :azn, :blk, :pac, :wh, :household_id])
    end
end
