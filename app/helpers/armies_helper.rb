module ArmiesHelper
  def alliances_available_to army
    alliances = []
    army.game.alliances.each do |alliance|
      alliances << alliance if alliance.users.include? army.user
    end
    alliances
  end
end
