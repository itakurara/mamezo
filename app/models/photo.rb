class Photo < ActiveRecord::Base
  validates :file, presence: true
end
