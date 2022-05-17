class WarehousesController < ApplicationController
  before_action :find_warehouse, only: %i[show edit update destroy]

  def index
    @warehouses = Warehouse.all
  end

  def show
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new warehouse_params
    if @warehouse.save
      flash[:success] = "Warehouse was successfully created"
      redirect_to @warehouse
    else
      flash.now[:error] = "Warehouse was not created"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @warehouse.update warehouse_params
      flash[:success] = "Warehouse information was succesfully updated"
      redirect_to @warehouse
    else
      flash.now[:error] = "Warehouse information was not updated"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @warehouse.destroy
      flash[:success] = "Warehouse was successfully deleted"
      redirect_to warehouses_path, status: :see_other
    else
      flash[:error] = "Warehouse was not deleted"
      render @hymn, status: :unprocessable_entity
    end
  end

  private

  def find_warehouse
    @warehouse = Warehouse.find_by id: params[:id]
  end

  def warehouse_params
    params.require(:warehouse).permit %i[name location description]
  end
end
