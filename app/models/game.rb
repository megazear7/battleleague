class Game < ActiveRecord::Base
  belongs_to :map
  has_and_belongs_to_many :users
  has_many :armies
  has_one :game_master, through: :game_masters, source: :user

  def players
    self.users
  end

end
