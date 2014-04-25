class Army < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def close_to user
    user.armies.where(game: self.game).each do |army|
      if army.x_cord and army.y_cord
        if (army.x_cord - self.x_cord < 2 and army.x_cord - self.x_cord > 2) or (army.y_cord - self.y_cord < 2 and army.y_cord - self.y_cord > 2)
          return true
        end
      end
    end
    return false
  end

end
