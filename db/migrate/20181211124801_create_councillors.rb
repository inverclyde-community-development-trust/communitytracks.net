class CreateCouncillors < ActiveRecord::Migration[5.2]
  def change
    create_table :councillors do |t|
      t.string :name
      t.string :photo_url
      t.string :council_url
      t.references :ward, foreign_key: true

      t.timestamps
    end
  end
end
