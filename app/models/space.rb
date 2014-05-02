class Space < ActiveRecord::Base
  belongs_to :map
  belongs_to :army

  def armies
    self.map.game.armies.where(x_cord: self.x_cord, y_cord: self.y_cord)
  end

end
