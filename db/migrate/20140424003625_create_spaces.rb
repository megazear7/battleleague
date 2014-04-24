class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :x_cord
      t.integer :y_cord
      t.string :terrain

      t.integer :map_id

      t.timestamps
    end
  end
end
