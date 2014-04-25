class Map < ActiveRecord::Base
  has_one :game
  has_many :spaces

  def width
    self.spaces.maximum("x_cord")
  end

  def height
    self.spaces.maximum("y_cord")
  end

end
