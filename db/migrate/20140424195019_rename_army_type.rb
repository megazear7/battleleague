class RenameArmyType < ActiveRecord::Migration
  def change
    rename_column :armies, :type, :army_type
  end
end
