class ChangeDatatypeFileOfPhotos < ActiveRecord::Migration
  def change
    change_column :photos, :file, :binary
  end
end
