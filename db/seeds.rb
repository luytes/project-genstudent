# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "yaml"
require "open-uri"

puts 'Cleaning database...'
Service.destroy_all
User.destroy_all
# Student.destroy_all

category = Service::CATEGORIES.keys.sample.to_s

address = ["Spreekanal, 10179 Berlin", "Alexanderplatz, 10178 Berlin",
           "Kollwitzplatz, Kollwitzstraße 1, 10405 Berlin",
           "Zionskirchplatz, Zionskirchstraße, 10119 Berlin"]
password = Faker::Internet.password(8)
SKILLS = ["acting", "directing", "writing", "editing", "sound"]
SUBJECT = ["math", "chemistry", "engineering", "science"]
GENDER = ["men", "women"]
NUMBER = (0..99)
url = "https://randomuser.me/api/portraits/#{GENDER.sample}/#{rand(NUMBER)}.jpg"

# SEEDING USERS
puts 'Creating Users...'
2.times do
  u = User.new(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraph(2),
    portfolio_url: "www.portfolio.com",
    skills: "#{SKILLS.sample} and #{SKILLS.sample}"
    )
  u.remote_profile_picture_url = url
  u.save!
end


# SEEDING STUDENTS
# 20.times do
#   Student.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     description: Faker::Lorem.paragraph(2),
#     skills: "#{SKILLS.sample} and #{SKILLS.sample}",
#     cost: 500,
#     year: "#{rand(NUMBER)}",
#     university: "Chemi university",
#     subject: "#{SUBJECT.sample}",
#     rating: (1..5).to_a.sample,
#     category: category,
#     degree: "Master",
#     remote_student_picture_url: url,
#     )
# end

puts 'Creating services...'

Service.create!(
    title: "Noches de teatro.",
    description: "Noches de teatro (or Theatre Nights) is a documentary short-film in production selected for the Identidad y Pertenencia contest at the Guanajuato International Film Festival. Our story is about Ivanna Tovar, a young transgender actress from Guanajuato, Mexico. We follow Ivanna as she directs and rehearses for Noches de Cabaret with her theatre group La Cabaretera Escénica. Center stage are her fears, her deepest feelings, the concerns of being different and the desire of being a spokeswoman for people whose voices are often misheard.
",
    category: "film",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/205/161/dc52b24cf918b327820fe59cd9286b66_original.png?w=680&fit=max&v=1491844850&auto=format&lossless=true&s=e9f5719089c4b5dd161ccb69fe2958e0",
    # owner: User.all.sample,
    price: 10,
  )

Service.create!(
    title: "In the Air",
    description: "Environmental justice is the fair treatment and meaningful involvement of all people regardless of race, color, national origin, or income, with respect to the development, implementation, and enforcement of environmental laws, regulations, and policies. It will be achieved when all people have the same degree of protection from environmental and health hazards, as well as equal access to the decision making process to have a healthy environment in which to live, learn, and work.",
    category: "film",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/118/731/1e64c31529f786fee57fb6b78125b995_original.jpg?w=680&fit=max&v=1491248233&auto=format&q=92&s=38783ac2eadede486bb5f2348ed7674b",
    # owner: User.all.sample,
    price: 10,
  )

Service.create!(
    title: "Legal Termination of a Warlock.",
    description: "It's a genre bender filtering urban fantasy, horror and detective fiction through a sardonic worldview.  The influences are The Night Stalker by way of Raymond Chandler, Dashiell Hammett and Art Buchwald.",
    category: "journalism",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/063/697/187f0c894fa55e864f0bdfea333c5706_original.png?w=680&fit=max&v=1490870733&auto=format&lossless=true&s=241882d4b02654f5c98012859b9a8b00",
    # owner: User.all.sample,
    price: 10,
  )

Service.create!(
    title: "The Florence Dance Festival",
    description: "Molissa, assisted by Christiana Axelsen will be very busy while in Florence, as the week residency will require her to teach contemporary classes, set a new work on the dancers of Toscana Dance HUB, mentor dance musicians of Music HUB and User choreographers, plus rehearse and perform at the Florence Dance Festival.",
    category: "theater",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/481/464/84ac7de1832e19a38cb480e70672cd7f_original.jpg?w=680&fit=max&v=1493666758&auto=format&q=92&s=5aa629f3e0622619194178a49a28a02e",
    # owner: User.all.sample,
    price: 10,
  )


Service.create!(
    title: "Gravity: The Weighted Blanket",
    description: "Gravity is a premium-grade, therapeutic weighted blanket that harnesses the power of deep touch stimulation – a proven anxiety treatment – to gently distribute deep pressure across your body.",
    category: "design",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/316/565/cff9e7bdc4eb8fefbfb5c0e47e179a43_original.png?w=680&fit=max&v=1492614995&auto=format&lossless=true&s=0cbd8b4a2669c9b24a015a34fa1a3260",
    # owner: User.all.sample,
    price: 10,
  )

puts 'Finished!'

