module ApplicationHelper

  def map map
    html = ""
    map.height.times do |y|
      html += "<div class='space-row'>"
      map.width.times do |x|
        space = map.spaces.where(x_cord: x+1, y_cord: y+1).first
        space = Space.new(x_cord: x+1, y_cord: y+1, terrain: "Terrain Unknown") if not space
        html += "<span class='space' id='#{x+1}-#{y+1}' style='width: #{500/map.width}px; height: #{500/map.height}px'>"
        html += space.terrain
        html += "</span>"
      end
      html += "</div>"
    end
    html.html_safe
  end

  def test map
    html = ""
    map.height.times do |y|
      map.width.times do |x|
        space = map.spaces.where(x_cord: x+1, y_cord: y+1).first
        space = Space.new(x_cord: x+1, y_cord: y+1, terrain: "Terrain Unknown", map: map) if not space
        yield space
      end
    end
    html.html_safe
  end

  def space_display space
    html = ""
    html += "<span class='space' id='#{space.x_cord+1}-#{space.y_cord+1}' style='width: #{500/space.map.width}px; height: #{500/space.map.height}px; position: absolute; bottom: #{(510/space.map.height) * space.y_cord+1}px; left: #{(510/space.map.width) * space.x_cord+1}px;'>"
    html += space.terrain
    html += "</span>"
    html.html_safe
  end

end
