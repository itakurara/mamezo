class AddAttachmentThumbToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :thumb
    end
  end

  def self.down
    remove_attachment :photos, :thumb
  end
end
