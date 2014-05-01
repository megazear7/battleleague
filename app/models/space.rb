class Space < ActiveRecord::Base
  belongs_to :map
  belongs_to :army

  def color current_user
    if self.army and self.army.allied_to(current_user)
      return "blue"
    elsif self.army
      return "red"
    end
  end

end
