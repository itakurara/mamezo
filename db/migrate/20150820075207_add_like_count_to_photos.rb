class AddLikeCountToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :like_count, :integer, :default => 0, :null => false
  end
end
