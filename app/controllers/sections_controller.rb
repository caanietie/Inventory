class SectionsController < ApplicationController
  def index
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @sections = @warehouse.sections
  end

  def show
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:id]
  end

  def new
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = Section.new
  end

  def create
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.build section_params
    if @section.save
      flash[:success] = "Section was succesfully created in the warehouse"
      redirect_to [@warehouse, @section]
    else
      flash.now[:error] = "Section was not created in the warehouse"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:id]
  end

  def update
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:id]
    if @section.update section_params
      flash[:success] = "Section was succesfully updated in the warehouse"
      redirect_to [@warehouse, @section]
    else
      flash.now[:error] = "Section was not updated in the warehouse"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse = Warehouse.find_by id: params[:warehouse_id]
    @section = @warehouse.sections.find_by id: params[:id]
    if @section.destroy
      flash[:success] = "Section was succesfully deleted in the warehouse"
      redirect_to warehouse_sections_path(@warehouse), status: :see_other
    else
      flash.now[:error] = "Section was not deleted in the warehouse"
      redirect_to [@warehouse, @section], status: :see_other
    end
  end

  private

  def section_params
    params.require(:section).permit %i[name code description]
  end
end