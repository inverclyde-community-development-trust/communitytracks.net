class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :organisation
      t.text :description
      t.string :contact
      t.string :email
      t.string :phone
      t.string :website
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
