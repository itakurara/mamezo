class AddThumbToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :thumb, :string
  end
end
