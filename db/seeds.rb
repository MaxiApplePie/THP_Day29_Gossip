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
  )
end

User.create!(first_name: "LAURENT", last_name: "MOLLARD-CHAUMETTE", description: "gfgfgkfkffjkgfj", email: "LMC@OUTLOOK.FR", age: 52, city_id: 21, password_digest: 'klhjgglljkgkl') 
User.create!(
  first_name: "LAURENT",
  last_name: "MOLLARD-CHAUMETTE",
  description: "gfgfgkfkffjkgfj",
  email: "LMC@OUTLOOK.FR",
  age: 52,
  city_id: 21

  City.find_by(name: params[:city]).id

"utf8"=>"✓", "authenticity_token"=>"HVqNBihmsLzDO+faz4BcwWPSNGbtLXldXFqdIGrXvNffnijrN61pAYvztr7ZQ6VDmDrk3mTCHtabDC0KD4J6fw==", "first_name"=>"LAURENT", "last_name"=>"MOLLARD-CHAUMETTE", "description"=>"gfgfgkfkffjkgfj", "email"=>"LMC@OUTLOOK.FR", "age"=>"52", "city"=>"CHIROLS", "zip_code"=>"07380", "password"=>"tututu", "password_confirmation"=>"tututu", "commit"=>"Sign up", "controller"=>"users", "action"=>"create"}


10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 18..70),
    city_id: City.all.sample.id,
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
