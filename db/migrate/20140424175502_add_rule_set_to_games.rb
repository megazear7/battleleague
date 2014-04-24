class AddRuleSetToGames < ActiveRecord::Migration
  def change
    add_column :games, :rule_set, :string
  end
end
