class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_hash
      t.datetime :created_at
      t.datetime :updated_at
      t.string :phone_number

      t.timestamps
    end
  end
end
