class Favorite < ActiveRecord::Base
  attr_accessible :track, :url, :user_id
end
