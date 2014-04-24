class Game < ActiveRecord::Base
  belongs_to :map
  has_and_belongs_to_many :users
  has_many :armies
  belongs_to :game_master, :class_name => 'User', :foreign_key => 'game_master_id'

  def players
    self.users
  end

end
