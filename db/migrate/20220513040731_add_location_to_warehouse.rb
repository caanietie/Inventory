class AddLocationToWarehouse < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouses, :location, :string
  end
end
