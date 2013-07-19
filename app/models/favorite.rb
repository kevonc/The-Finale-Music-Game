class Favorite < ActiveRecord::Base
  attr_accessible :track, :url, :user_id, :genre, :uploaded_by, :created, :artwork, :soundcloud_id
  belongs_to :user

  validates :soundcloud_id, uniqueness: true
  default_scope order('id DESC')
end