class AddTurnCountToArmies < ActiveRecord::Migration
  def change
    add_column :armies, :turn_count, :integer
  end
end
