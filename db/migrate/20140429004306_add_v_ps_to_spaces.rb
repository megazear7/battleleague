class AddVPsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :victory_points, :integer
  end
end
