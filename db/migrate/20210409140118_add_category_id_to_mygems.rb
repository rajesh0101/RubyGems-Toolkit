class AddCategoryIdToMygems < ActiveRecord::Migration[6.1]
  def change
    add_column :mygems, :category_id, :integer
  end
end
