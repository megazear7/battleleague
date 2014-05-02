module ApplicationHelper

  def comment_types game, user
    if game.armies.where(user: user).first.alliance
      [ ["Public", "public"], ["Team", "team"], ["Whisper", "whisper"] ]
    else
      [ ["Public", "public"], ["Whisper", "whisper"] ]
    end
  end

  def themes
    [ ["Standard", "theme1.min"], ["Fun", "theme2.min"], ["Dark", "theme3.min"], ["Light", "theme4.min"], ["Pale", "theme5.min"], ["Plain", "theme6.min"] ]
  end

  def color_of_space space, current_user
    if space.army and ( space.army.allied_to(current_user) or current_user.armies.include?(space.army) )
      return "blue"
    elsif space.army
      return "red"
    end
  end

end
