# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Event.destroy_all
Contribution.destroy_all
Speaker.destroy_all

require 'faker'

street_names = ["Rue Jean Robert", "Rue de Crimée", "Rue Lacépède", "Rue du commandant Lammy", "Rue de la grande truanderie", "Avenue de l'Opéra", "Avenue d'Italie", "Rue Bichat", "Boulevard Perèire"]

category = ['Sciences & technologies', 'Histoire & Futur', "Sante & Education", "Economie", "Litterature & Philosophie"]

puts 'Creating 20 fake events...'
20.times do
  event = Event.new(
    user: User.find(1),
    title:    "#{Faker::Company.name}",
    location: "#{rand(1..80)} #{street_names.sample}, PARIS",
    description: "#{Faker::Lorem.paragraph}",
    starts_at:  Faker::Date.between_except(from: Date.today, to: 1.year.from_now, excepted: Date.today),
    ends_at:  Faker::Date.between_except(from: 1.year.from_now, to: 2.year.from_now, excepted: Date.today),
    seats: "#{rand(20..100)}",
    category: category.sample,
    picture: "https://picsum.photos/200",
  )
  event.save!
end
puts 'Finished!'


puts 'Creating 10 fake speakers...'
10.times do
  speaker = Speaker.new(
    first_name: "#{Faker::Name.first_name}",
    last_name:   "#{Faker::Name.last_name}",
  )
  speaker.save!
end
puts 'Finished!'

@speaker = Speaker.all
puts Event.all
puts "______________________________________________________"
puts @speaker
puts @speaker.class


puts 'Creating 20 fake contributions...'
20.times do
  puts Speaker.order("RANDOM()").limit(1).ids
  puts Event.order("RANDOM()").limit(1).ids
  contribution = Contribution.new(
    speakers_id: Speaker.order("RANDOM()").limit(1).ids,
    events_id:   Event.order("RANDOM()").limit(1).ids,
  )
  contribution.save!
end
puts 'Finished!'
