class AddLocationAttributesToArmies < ActiveRecord::Migration
  def change
    add_column :armies, :x_cord, :integer
    add_column :armies, :y_cord, :integer
    remove_column :armies, :space_id
  end
end
