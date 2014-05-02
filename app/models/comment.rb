class Comment < ActiveRecord::Base
  belongs_to :army # this is the army that made the comment (the user that made the comment is comment.army.user
  belongs_to :user # this is who the comment was sent to

  validate :whisper_has_user

  def whisper_has_user
    if self.comment_type == "whisper" and self.user == nil
      errors.add(:user, "Whispers must have a user")
    end
  end

  def is_viewable_by user
    if self.comment_type == "public" or (self.comment_type == "team" and self.army.allied_to(user))  or ( self.comment_type == "whisper" and ( self.user == user or self.army.user == user ) )
      true
    else
      false
    end
  end

end
