class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true, null: false
      t.string :likeable_type, null: false
      t.integer :likeable_id, null: false

      t.timestamps
    end
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
