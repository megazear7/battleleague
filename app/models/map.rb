class Map < ActiveRecord::Base
  has_one :game
  has_many :spaces

  def self.for_selection
    maps = []
    Map.all.each do |map|
      maps << map if not map.game
    end
    maps
  end

  def width
    self.spaces.maximum("x_cord")
  end

  def height
    self.spaces.maximum("y_cord")
  end

end
