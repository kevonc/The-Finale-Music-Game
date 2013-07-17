class Favorite < ActiveRecord::Base
  attr_accessible :track, :url, :user_id, :genre, :uploaded_by, :created, :artwork, :soundcloud_id
  validates :soundcloud_id, uniqueness: true
end
