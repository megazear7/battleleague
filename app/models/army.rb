class Army < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  belongs_to :game
end
