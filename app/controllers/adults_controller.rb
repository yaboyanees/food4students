class AdultsController < ApplicationController
  before_action :set_adult, only: [:edit, :update]
  
  def edit
  end
  
  def create
    @adult = Adult.new(adult_params)

    respond_to do |format|
      if @adult.save
        format.html { redirect_to(:back) }
      else
        format.html { redirect_to(:back) }
      end
    end
  end

  def update
    respond_to do |format|
      if @adult.update(adult_params)
        format.html { redirect_to(:back) }
      else
        format.html { redirect_to(:back) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adult
      @adult = Adult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adult_params
      params.require(:adult).permit(:name, :job, :cs, :ret, :pa, :pen, :ali, :se, :mil, :other, :household_id)
    end
end
