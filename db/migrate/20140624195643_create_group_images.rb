class CreateGroupImages < ActiveRecord::Migration
  def change
    create_table :group_images do |t|
      t.integer :image_id, null: false
      t.integer :group_id, null: false

      t.timestamps
    end
    add_index :group_images, [:image_id, :group_id], unique: true
  end
end
