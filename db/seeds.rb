# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

Message.destroy_all
User.destroy_all
Channel.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Create channels
channel_names = %w(general paris react)
channels = channel_names.map { |canal| channel = Channel.create! name: canal }

# Create some users (needs email / password)

10.times do
  user_name = Faker::Movies::HarryPotter.character
  if user_name.split(" ")[1].present?
    user = User.new(
      email: "#{user_name.split(" ")[0]}.#{user_name.split(" ")[1].downcase}@gmail.com",
      password: Faker::Movies::HarryPotter.spell + rand(459..489).to_s
    )
    next if User.find_by(email: "#{user_name.split(" ")[0].downcase}.#{user_name.split(" ")[1].downcase}@gmail.com").present?
    user.save!
  end
end

users = User.all

User.create! email: "emma@gmail.com", password: "123456"

# Create some messages in several channels.

20.times do
  Message.create! user: users.sample, channel: channels.sample, content: Faker::Movies::HarryPotter.quote
end

puts 'Channels:'
channels.each do |channel|
  puts "- #{channel.id}: #{channel.name}"
end
