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

end
