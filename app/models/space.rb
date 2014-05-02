class Space < ActiveRecord::Base
  belongs_to :map
  belongs_to :army
end
