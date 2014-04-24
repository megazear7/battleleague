class Space < ActiveRecord::Base
  belongs_to :map
  has_many :armies
end
