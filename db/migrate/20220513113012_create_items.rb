class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.string :description
      t.integer :quantity
      t.string :measure
      t.references :zone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
