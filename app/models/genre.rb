class Genre < ActiveRecord::Base
  attr_accessible :kind

  def Genre.list
    self.all.sample(3)
  end
end