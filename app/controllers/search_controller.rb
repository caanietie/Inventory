class SearchController < ApplicationController
    def show
        @search = []
        what = params[:what].strip
        by = params[:by].strip
        value = params[:value].strip
        if what.in? %w[warehouse section zone item] and by.in? %w[name code]
            case what
            when "warehouse"
                if by.eql? "code"
                    flash[:notice] = "code is not a parameter for warehouse"
                else
                    Warehouse.where(by => value).each do |itm|
                        @search << [itm.name, warehouse_path(itm.id)]
                    end
                end
            when "section"
                Section.where(by => value).each do |itm|
                    @search << [itm.name, warehouse_section_path(itm.warehouse_id, itm.id)]
                end
            when "zone"
                Zone.where(by => value).each do |itm|
                    s = Section.find_by id: itm.section_id
                    @search << [itm.name, warehouse_section_zone_path(s.warehouse_id, itm.section_id, itm.id)]
                end
            when "item"
                Item.where(by => value).each do |itm|
                    z = Zone.find_by id: itm.zone_id
                    s = Section.find_by id: z.section_id
                    @search << [itm.name, warehouse_section_zone_path(s.warehouse_id, s.id, itm.zone_id, itm.id)]
                end
            else
                flash.now[:notice] = "Nothing was found for this search parameters"
            end
        else
            flash.now[:notice] = "Invalid search parameters"
            # change this to remain on the page user was on
            redirect_back fallback_location: warehouses_path
        end
    end
end
