class ZonesController < ApplicationController
  def index
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zones = @section.zones
  end

  def show
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:id]
  end

  def new
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = Zone.new
  end

  def create
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.build zone_params
    if @zone.save
      flash[:success] = "Zone was succesfully created in this section of the warehouse"
      redirect_to [@warehouse, @section, @zone]
    else
      flash.now[:error] = "Zone was not created in this section of the warehouse"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:id]
  end

  def update
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:id]
    if @zone.update zone_params
      flash[:success] = "Zone was succesfully updated in this section of the warehouse"
      redirect_to [@warehouse, @section, @zone]
    else
      flash.now[:error] = "Zone was not updated in this section of the warehouse"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:section_id]
    @zone = @section.zones.find_by id: params[:id]
    if @zone.destroy
      flash[:success] = "Zone was succesfully deleted in this section of the warehouse"
      redirect_to [@warehouse, @section]
    else
      flash[:error] = "Zone was not deleted in this section of the warehouse"
      redirect_to [@warehouse, @section, @zone]
    end
  end

  private

  def zone_params
    params.require(:zone).permit %i[name code description]
  end
end
