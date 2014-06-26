class CreateImageTags < ActiveRecord::Migration
  def change
    create_table :image_tags do |t|
      t.belongs_to :image, index: true, null: false
      t.belongs_to :tag, index: true, null: false
      t.timestamps
    end
    add_index :image_tags, [:image_id, :tag_id], unique: true
  end
end
