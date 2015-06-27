class Photo < ActiveRecord::Base
  validates :file, presence: true
  validates :comment, length: {maximum: 60}
end
