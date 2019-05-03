class AddUrlSlugToWards < ActiveRecord::Migration[5.2]
  def change
    add_column :wards, :url_slug, :string
  end
end
