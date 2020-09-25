# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

Message.destroy_all
User.destroy_all
Channel.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

channels = %w(general paris react)
channels.each do |canal|
  channel = Channel.new(
    name: canal
  )
  channel.save!
end


Create some users (needs email / password)

Create some messages in several channels.

20.times do
  Message.create! user: users.sample, channel: channels.sample, content: Faker::HowIMetYourMother.quote
end
