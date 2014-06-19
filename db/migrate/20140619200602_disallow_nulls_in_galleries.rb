class DisallowNullsInGalleries < ActiveRecord::Migration
  def change
    change_column_null :galleries, :user_id, false
  end
end
