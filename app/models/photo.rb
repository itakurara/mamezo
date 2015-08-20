class Photo < ActiveRecord::Base
  validates_attachment :file, :presence => true, :content_type => /^image\/(png|gif|jpeg)/
  validates :comment, length: {maximum: 60}

  has_attached_file :file, styles: {thumb: "290x"}
  # :fileて名前だめかもしれない。
  # modelしか変えてない
end
