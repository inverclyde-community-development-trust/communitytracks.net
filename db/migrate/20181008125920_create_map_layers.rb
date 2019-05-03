class CreateMapLayers < ActiveRecord::Migration[5.2]
  def change
    create_table :map_layers do |t|
      t.string :name
      t.references :ward, foreign_key: true

      t.timestamps
    end
  end
end
