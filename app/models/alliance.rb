class Alliance < ActiveRecord::Base
  belongs_to :game
  has_many :armies
  has_and_belongs_to_many :users
end
