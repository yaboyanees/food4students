class OptionalsController < ApplicationController
  before_action :set_optional, only: [:edit, :update]


  def edit
  end

  def create
    @optional = Optional.new(optional_params)

    respond_to do |format|
      if @optional.save
        format.html { redirect_to household_path(@optional.household_id)}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @optional.update(optional_params)
        format.html { redirect_to @optional, notice: 'Optional was successfully updated.' }
        format.json { render :show, status: :ok, location: @optional }
      else
        format.html { render :edit }
        format.json { render json: @optional.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_optional
      @optional = Optional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def optional_params
      params.require(:optional).permit(:hl, :indy, :azn, :blk, :pac, :wh, :household_id)
    end
end
