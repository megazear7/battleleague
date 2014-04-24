class Map < ActiveRecord::Base
  has_many :spaces
  has_one :game

  def width
    self.spaces.maximum("x_cord")
  end

  def height
    self.spaces.maximum("y_cord")
  end

end
