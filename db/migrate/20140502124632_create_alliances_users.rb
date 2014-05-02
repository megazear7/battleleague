class CreateAlliancesUsers < ActiveRecord::Migration
  def change
    create_table :alliances_users do |t|
      t.belongs_to :alliance
      t.belongs_to :user
    end
  end
end
