class AddDescriptionToZone < ActiveRecord::Migration[7.0]
  def change
    add_column :zones, :description, :text
  end
end
