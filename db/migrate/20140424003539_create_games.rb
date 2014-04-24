class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.text :objective
      t.text :details
      
      t.integer :game_master_id
      t.integer :map_id

      t.timestamps
    end
  end
end
