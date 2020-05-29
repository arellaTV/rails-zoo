class ZoosController < ApplicationController
  def new
  end

  def create
    @zoo = Zoo.new(zoo_params)
    
    @zoo.save
    redirect_to @zoo
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  private
    def zoo_params
      params.require(:zoo).permit(:name, :description, :address);
    end
end
