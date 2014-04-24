class CreateArmies < ActiveRecord::Migration
  def change
    create_table :armies do |t|
      t.string :name
      t.text :description
      t.integer :point_cost
      t.string :type
      t.integer :movement_rate

      t.integer :game_id
      t.integer :space_id
      t.integer :user_id

      t.timestamps
    end
  end
end
