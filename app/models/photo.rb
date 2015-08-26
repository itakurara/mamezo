class Photo < ActiveRecord::Base
  #has_attached_file :thumb, styles: {thumb: "290x"}
  mount_uploader :thumb, ThumbUploader

  #validates_attachment :thumb, :presence => true, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates :comment, length: {maximum: 60}
end
