class Game < ActiveRecord::Base
  attr_accessible :points, :user_id
  belongs_to :user
end
