class AddMygemIdToPreviews < ActiveRecord::Migration[6.1]
  def change
    add_column :previews, :mygem_id, :integer
  end
end
