class Admin::ZoosController < ApplicationController
  layout "admin"

  before_action :authenticate_user!

  def index
    @zoos = Zoo.all
  end

  def new
    @zoo = Zoo.new
  end

  def edit
    @zoo = Zoo.find(params[:id])
  end

  def create
    @zoo = Zoo.new(zoo_params)
    
    if @zoo.save
      redirect_to edit_admin_zoo_path(@zoo)
    else
      render 'new'
    end
  end

  def update
    @zoo = Zoo.find(params[:id])
   
    @zoo.update(zoo_params)
    redirect_to edit_admin_zoo_path(@zoo)
  end


  def destroy
    @zoo = Zoo.find(params[:id])
    @zoo.destroy
  
    redirect_to admin_zoos_path
  end

  private
    def zoo_params
      params.require(:zoo).permit(:name, :description, :address, :cover_photo);
    end
end
