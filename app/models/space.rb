class Space < ActiveRecord::Base
  belongs_to :map
  has_many :armies

  def armies
    self.map.armies.where(x_cord: self.x_cord, y_cord: self.y_cord)
  end

end
