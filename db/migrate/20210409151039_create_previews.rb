class CreatePreviews < ActiveRecord::Migration[6.1]
  def change
    create_table :previews do |t|
      t.integer :rating
      t.text :comment
      
      t.timestamps
    end
  end
end
