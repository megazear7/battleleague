class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :armies

  has_and_belongs_to_many :games
  has_many :games_as_master, :foreign_key => 'game_master_id', :class_name => "Game"

  def games_where_I_am_a_player
    self.games
  end

  def games_where_I_am_the_game_master
    self.games_as_master
  end

end
