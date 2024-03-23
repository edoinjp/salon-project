class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.datetime :booking_date
      t.string :booking_status
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
