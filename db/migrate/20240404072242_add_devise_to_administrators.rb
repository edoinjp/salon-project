class AddDeviseToAdministrators < ActiveRecord::Migration[7.1]
  def self.up
    change_table :administrators do |t|
      ## Remove unnecessary columns and indexes
      # Remove this line if you have a valid reason to add rememberable functionality
      t.remove :remember_created_at
    end
  end

  def self.down
    # Revert changes made in self.up if needed
    change_table :administrators do |t|
      t.datetime :remember_created_at
    end
  end
end
