class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :user, index: true, null: false
      t.integer :followed_id, null: false
    end
    add_index :follows, [:user_id, :followed_id], unique: true
  end
end
