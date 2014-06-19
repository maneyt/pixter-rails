class AddIndexes < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    
    add_index :images, :gallery_id 
  end
end
