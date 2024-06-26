# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create admin user
admin = Administrator.find_or_create_by(email: 'admin@example.com') do |admin|
  admin.username = 'admin'
  admin.password = 'password'
  admin.password_confirmation = 'password'
  admin.role = 'admin' # Set the role to 'admin' for the admin user
end

if admin.persisted?
  puts "Admin user created successfully!"
else
  puts "Error creating admin user: #{admin.errors.full_messages.join(', ')}"
end
