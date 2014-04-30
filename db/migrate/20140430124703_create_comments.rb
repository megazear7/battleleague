class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :content
      t.string  :comment_type  # expects: "public", "team", "whisper"
      t.integer :user_id # this would be which user the comment was sent to
      t.integer :army_id
      t.timestamps
    end
  end
end
