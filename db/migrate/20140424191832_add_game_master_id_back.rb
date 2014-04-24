class AddGameMasterIdBack < ActiveRecord::Migration
  def change
    add_column :games, :game_master_id, :integer
  end
end
