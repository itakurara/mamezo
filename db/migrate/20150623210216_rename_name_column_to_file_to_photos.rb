class RenameNameColumnToFileToPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :name, :file
  end
end
