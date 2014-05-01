class AddArmyIdToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :army_id, :integer
  end
end
