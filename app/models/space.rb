class Space < ActiveRecord::Base
  belongs_to :map
  belongs_to :army

  def color current_user
    if self.army and ( self.army.allied_to(current_user) or current_user.armies.include?(self.army) )
      return "blue"
    elsif self.army
      return "red"
    end
  end

end
