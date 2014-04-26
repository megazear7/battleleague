class Game < ActiveRecord::Base
  belongs_to :map
  has_and_belongs_to_many :users
  has_many :armies
  belongs_to :game_master, :class_name => 'User', :foreign_key => 'game_master_id'
  has_many :alliances

  def current_army
    turn = self.armies.maximum("turn_count")
    self.armies.where(turn_count: turn).first
  end

  def players
    self.users
  end

end
