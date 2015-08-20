class Photo < ActiveRecord::Base
  validates_attachment :thumb, :presence => true, :content_type => /^image\/(png|gif|jpeg)/
  validates :comment, length: {maximum: 60}

  has_attached_file :thumb, styles: {thumb: "290x"}
  # :fileて名前だめかもしれない。
  # modelしか変えてない
end
