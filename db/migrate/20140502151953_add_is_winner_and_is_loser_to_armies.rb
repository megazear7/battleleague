class AddIsWinnerAndIsLoserToArmies < ActiveRecord::Migration
  def change
    add_column :armies, :is_winner, :boolean
    add_column :armies, :is_loser, :boolean
  end
end
