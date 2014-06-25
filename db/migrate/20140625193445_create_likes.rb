class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :image, index: true, null: false

      t.timestamps
    end

    add_index :likes, [:user_id, :image_id], unique: true
  end
end
