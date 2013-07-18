class Game < ActiveRecord::Base
  attr_accessible :points, :user_id
  belongs_to :user

  default_scope order('id ASC')
end