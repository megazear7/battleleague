class Game < ActiveRecord::Base
  belongs_to :map
  has_and_belongs_to_many :users
  has_many :armies
  belongs_to :game_master, through: :game_masters, source: :user

  def players
    self.users
  end

end
