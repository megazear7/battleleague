class Game < ActiveRecord::Base
  belongs_to :map, :dependent => :destroy
  has_and_belongs_to_many :users
  has_many :armies, dependent: :destroy
  belongs_to :game_master, :class_name => 'User', :foreign_key => 'game_master_id'
  has_many :alliances, dependent: :destroy
  has_many :comments, through: :armies

  def has_battle_at x, y
    space = self.map.spaces.where(x_cord: x, y_cord: y).first
    space = Space.new(x_cord: x, y_cord: y, terrain: "", victory_points: 0, map: map) if not space
    space.armies.each do |army1|
      space.armies.each do |army2|
        return true if (not army1.allied_to(army2.user)) and (army1 != army2)
      end
    end
    return false
  end

  def needs_resolved
    return true if self.armies.where(is_winner: true).size > 0
    return true if self.armies.where(is_loser: true).size > 0
    (1..self.map.width).each do |x|
      (1..self.map.height).each do |y|
        space = self.map.spaces.where(x_cord: x+1, y_cord: y+1).first
        space = Space.new(x_cord: x+1, y_cord: y+1, terrain: "", victory_points: 0, map: map) if not space
        space.armies.each do |army1|
          space.armies.each do |army2|
            return true if not army1.allied_to(army2.user)
          end
        end
      end
    end
    return false
  end

  def current_army
    turn = self.armies.maximum("turn_count")
    self.armies.where(turn_count: turn).first
  end

  def players
    self.users
  end

  def has_joined user
    if self.armies.where(user: user).first
      true
    else
      false
    end
  end

end
