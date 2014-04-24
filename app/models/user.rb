class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :armies

  # this part still needs worked out:
  has_and_belongs_to_many :games
  # http://stackoverflow.com/questions/18690700/multiple-has-many-relationships-to-same-model
  has_many :games_as_master, through: :game_masters, source: :games
  def games_where_I_am_a_player
    self.games
  end
  def games_where_I_am_a_gamemaster
    self.games_as_master
  end

end
