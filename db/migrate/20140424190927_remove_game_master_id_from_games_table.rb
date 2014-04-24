class RemoveGameMasterIdFromGamesTable < ActiveRecord::Migration
  def change
    remove_column :games, :game_master_id
  end
end
