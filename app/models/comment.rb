class Comment < ActiveRecord::Base
  belongs_to :army # this is the army that made the comment (the user that made the comment is comment.army.user
  belongs_to :user # this is who the comment was sent to
end
