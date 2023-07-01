# db/seeds.rb

# Clear existing data
User.destroy_all

# Create users
users = [
  { username: 'john_doe', password: 'password123', password_confirmation: 'password123' },
  { username: 'jane_smith', password: 'pass456', password_confirmation: 'pass456' },
  { username: 'user3', password: 'securepass', password_confirmation: 'securepass' }
]

users.each do |user_params|
  User.create(user_params)
end
