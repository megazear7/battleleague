class Game < ActiveRecord::Base
  belongs_to :map, :dependent => :destroy
  has_and_belongs_to_many :users
  has_many :armies, dependent: :destroy
  belongs_to :game_master, :class_name => 'User', :foreign_key => 'game_master_id'
  has_many :alliances, dependent: :destroy
  has_many :comments, through: :armies

  def current_army
    turn = self.armies.maximum("turn_count")
    self.armies.where(turn_count: turn).first
  end

  def players
    self.users
  end

end
