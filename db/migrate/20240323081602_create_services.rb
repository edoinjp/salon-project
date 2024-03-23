class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.decimal :price
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :order_sequence

      t.timestamps
    end
  end
end
