class ItemsController < ApplicationController
  def index
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:zone_id]
    @items = @zone.items
  end

  def show
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:zone_id]
    @item = @zone.items.find_by id: params[:id]
  end

  def new
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:zone_id]
    @item = Item.new
  end

  def create
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:zone_id]
    @item = @zone.items.build item_params
    if @item.save
      flash[:success] = "Item was succesfully created in this zone"
      redirect_to [@warehouse, @section, @zone, @item]
    else
      flash.now[:error] = "Item was not created in this zone"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:zone_id]
    @item = @zone.items.find_by id: params[:id]
  end

  def update
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:zone_id]
    @item = @zone.items.find_by id: params[:id]
    if @item.update item_params
      flash[:success] = "Item was succesfully updated in this zone"
      redirect_to [@warehouse, @section, @zone, @item]
    else
      flash.now[:error] = "Item was not updated in this zone"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:zone_id]
    @item = @zone.items.find_by id: params[:id]
    if @item.destroy
      flash[:success] = "Item was succesfully deleted in this zone"
      redirect_to [@warehouse, @section, @zone]
    else
      flash[:error] = "Item was not deleted in this zone"
      redirect_to [@warehouse, @section, @zone, @item]
    end
  end

  private

  def item_params
    params.require(:item).permit %i[name code quantity measure description]
  end
end