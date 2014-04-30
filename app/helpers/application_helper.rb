module ApplicationHelper
  def comment_types game, user
    if game.armies.where(user: user).first.alliance
      [ ["Public", "public"], ["Team", "team"], ["Whisper", "whisper"] ]
    else
      [ ["Public", "public"], ["Whisper", "whisper"] ]
    end
  end
end
