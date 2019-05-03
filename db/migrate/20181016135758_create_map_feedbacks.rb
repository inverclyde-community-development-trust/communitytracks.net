class CreateMapFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :map_feedbacks do |t|
      t.string :email
      t.text :text
      t.references :map_layer, foreign_key: true
      t.string :route_name

      t.timestamps
    end
  end
end
