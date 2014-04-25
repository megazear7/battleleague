module ApplicationHelper

  def display item, &block
    if item.class == Map
      return map item, &block
    elsif item.class == Space
      return space item, &block
    end
  end

  def map map
    html = ""
    html = "<div class='map-container'>"
    map.height.times do |y|
      map.width.times do |x|
        space = map.spaces.where(x_cord: x+1, y_cord: y+1).first
        space = Space.new(x_cord: x+1, y_cord: y+1, terrain: "Terrain Unknown", map: map) if not space
        yield space
      end
    end
    html += "</div>"
    html.html_safe
  end

  def space space
    html = ""
    html += "<span class='space' id='#{space.x_cord}-#{space.y_cord}' style='width: #{500/space.map.width}px; height: #{500/space.map.height}px; position: absolute; bottom: #{(510/space.map.height) * (space.y_cord-1)}px; left: #{(510/space.map.width) * (space.x_cord-1)}px;'>"
    html += space.terrain
    html += "</span>"
    html.html_safe
  end

end
