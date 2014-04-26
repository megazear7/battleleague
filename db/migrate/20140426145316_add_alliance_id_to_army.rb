class AddAllianceIdToArmy < ActiveRecord::Migration
  def change
    add_column :armies, :alliance_id, :integer
  end
end
