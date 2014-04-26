class Alliance < ActiveRecord::Base
  belongs_to :game
  has_many :armies
end
