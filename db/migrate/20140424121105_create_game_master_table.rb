class CreateGameMasterTable < ActiveRecord::Migration
  def change
    create_table :game_masters do |t|
      t.integer :game_id
      t.integer :user_id
    end
  end
end
