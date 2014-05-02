class Army < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :alliance
  has_many   :comments, :dependent => :destroy
  validates  :movement_rate, presence: true
  validates  :game_id, presence: true
  validates  :name, presence: true
  validate :cordinates_with_limits

  def needs_resolved
    self.is_winner or self.is_loser
  end

  def allied_to user
    armies = []
    user.armies.where(game: self.game).each do |army|
      if self.alliance and army.alliance == self.alliance 
        return true
      end
    end
    return false
  end

  def cordinates_with_limits
    if x_cord and y_cord
      if x_cord > game.map.width or x_cord < 1
        errors.add(:x_cord, "Coordinates not in the bounds of the map")
      elsif y_cord > game.map.height or y_cord < 1
        errors.add(:y_cord, "Coordinates not in the bounds of the map")
      end
    end
  end

  def move_check x, y
    if self.x_cord and self.y_cord
      x = x.to_i
      y = y.to_i
      if x - self.x_cord > self.movement_rate or x - self.x_cord < -1 * self.movement_rate
        return false
      elsif y - self.y_cord > self.movement_rate or y - self.y_cord < -1 * self.movement_rate
        return false
      end
    end
    return true
  end

  def close_to user
    user.armies.where(game: self.game).each do |army|
      if army.x_cord and army.y_cord
        if (army.x_cord - self.x_cord < 2 and army.x_cord - self.x_cord > -2) and (army.y_cord - self.y_cord < 2 and army.y_cord - self.y_cord > -2)
          return true
        end
      end
    end
    return false
  end

end
