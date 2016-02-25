class ChildrenController < ApplicationController
  before_action :set_child, only: [:edit, :update]

  def edit
  end
  
  def create
    @child = Child.new(child_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to(:back) }
      else
        format.html { redirect_to(:back) }
      end
    end
  end

  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to(:back) }
      else
        format.html { redirect_to(:back) }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:name, :student, :foster, :hmr, :hs, :pay, :ss, :tru, :pen, :ann, :sm, :household_id)
    end
end
