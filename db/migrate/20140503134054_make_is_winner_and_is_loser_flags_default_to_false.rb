class MakeIsWinnerAndIsLoserFlagsDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :armies, :is_winner, :boolean, :default => false
    change_column :armies, :is_loser, :boolean, :default => false
  end
end
