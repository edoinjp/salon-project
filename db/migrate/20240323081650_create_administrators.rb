class CreateAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :administrators do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
