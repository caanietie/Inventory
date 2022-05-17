class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.string :name
      t.string :code
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
