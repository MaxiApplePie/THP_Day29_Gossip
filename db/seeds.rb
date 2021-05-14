require "faker"

LinkGossipTag.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
  )
end
1.times do
  User.create!(
    first_name: "anonymous",
    last_name: Faker::Name.last_name,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 18..70),
    city_id: City.all.sample.id,
    password: "ljhmh",
    )
end

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 18..70),
    city_id: City.all.sample.id,
    password: "ljhmh",
  )
end

20.times do
  Gossip.create!(
    title: Faker::Games::Overwatch.hero,
    content: Faker::Games::Overwatch.quote,
    user_id: User.all.sample.id,
  )
end

10.times do
  Tag.create!(title: Faker::Superhero.power)
end

10.times do
  LinkGossipTag.create!(
    gossip_id: Gossip.all.sample.id,
    tag_id: Tag.all.sample.id,
  )
end

10.times do
  PrivateMessage.create!(
    content: Faker::Movies::StarWars.quote,
    sender_id: User.all.sample.id,
    recipient_id: User.all.sample.id,
  )
end
