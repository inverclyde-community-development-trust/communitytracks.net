class CreateContactSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_submissions do |t|
      t.string :email
      t.text :text

      t.timestamps
    end
  end
end
