class AddShowOnHomepageToWards < ActiveRecord::Migration[5.2]
  def change
    add_column :wards, :show_on_homepage, :boolean, default: false
  end
end
