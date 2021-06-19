class AddUserIdToPreviews < ActiveRecord::Migration[6.1]
  def change
    add_column :previews, :user_id, :integer
  end
end
