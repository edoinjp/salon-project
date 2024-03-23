class CreateAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :administrators do |t|

      t.timestamps
    end
  end
end
