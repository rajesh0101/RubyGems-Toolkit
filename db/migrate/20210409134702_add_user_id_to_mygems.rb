class AddUserIdToMygems < ActiveRecord::Migration[6.1]
  def change
    add_column :mygems, :user_id, :integer
  end
end
