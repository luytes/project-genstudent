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
Student.destroy_all
User.destroy_all
Order.destroy_all

category = ["Content", "Social Media", "Design", "Research"]

address = ["Spreekanal, 10179 Berlin", "Alexanderplatz, 10178 Berlin",
           "Kollwitzplatz, Kollwitzstraße 1, 10405 Berlin",
           "Zionskirchplatz, Zionskirchstraße, 10119 Berlin"]
password = Faker::Internet.password(8)
SKILLS = ["acting", "directing", "writing", "editing", "sound"]
SUBJECT = ["math", "chemistry", "engineering", "science"]
GENDER = ["men", "women"]
NUMBER = (0..99)

# SEEDING USERS
puts 'Creating Users...'
2.times do
  u = User.new(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    skills: "#{SKILLS.sample} and #{SKILLS.sample}"
    )
  u.remote_profile_picture_url = "https://randomuser.me/api/portraits/#{GENDER.sample}/#{rand(NUMBER)}.jpg"
  u.save!
end

puts 'Creating Admin For Lisa...'
l = User.new(
  email: '123456@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Lisa',
  last_name: 'Chemi',
  skills: "Fragen wann es fertig ist",
  admin: true
  )
l.remote_profile_picture_url = "https://randomuser.me/api/portraits/#{GENDER.sample}/#{rand(NUMBER)}.jpg"
l.save!

puts 'Creating Students...'

# SEEDING STUDENTS
4.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    introduction: Faker::Lorem.paragraph(2),
    skills: "#{SKILLS.sample} and #{SKILLS.sample}",
    year: "#{rand(NUMBER)}",
    university: "Chemi university",
    subject: "#{SUBJECT.sample}",
    degree: "Master",
    remote_student_picture_url: "https://randomuser.me/api/portraits/#{GENDER.sample}/#{rand(NUMBER)}.jpg",
    email: Faker::Internet.email
    )
end

puts 'Creating Services...'

Service.create!(
    title: "Noches de teatro.",
    description: "Noches de teatro (or Theatre Nights) is a documentary short-film in production selected for the Identidad y Pertenencia contest at the Guanajuato International Film Festival. Our story is about Ivanna Tovar, a young transgender actress from Guanajuato, Mexico. We follow Ivanna as she directs and rehearses for Noches de Cabaret with her theatre group La Cabaretera Escénica. Center stage are her fears, her deepest feelings, the concerns of being different and the desire of being a spokeswoman for people whose voices are often misheard.
",
    category: category.sample,
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/205/161/dc52b24cf918b327820fe59cd9286b66_original.png?w=680&fit=max&v=1491844850&auto=format&lossless=true&s=e9f5719089c4b5dd161ccb69fe2958e0",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 10,
  )

Service.create!(
    title: "In the Air",
    description: "Environmental justice is the fair treatment and meaningful involvement of all people regardless of race, color, national origin, or income, with respect to the development, implementation, and enforcement of environmental laws, regulations, and policies. It will be achieved when all people have the same degree of protection from environmental and health hazards, as well as equal access to the decision making process to have a healthy environment in which to live, learn, and work.",
    category: category.sample,
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/118/731/1e64c31529f786fee57fb6b78125b995_original.jpg?w=680&fit=max&v=1491248233&auto=format&q=92&s=38783ac2eadede486bb5f2348ed7674b",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 22,
  )

Service.create!(
    title: "Legal Termination of a Warlock.",
    description: "It's a genre bender filtering urban fantasy, horror and detective fiction through a sardonic worldview.  The influences are The Night Stalker by way of Raymond Chandler, Dashiell Hammett and Art Buchwald.",
    category: category.sample,
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/063/697/187f0c894fa55e864f0bdfea333c5706_original.png?w=680&fit=max&v=1490870733&auto=format&lossless=true&s=241882d4b02654f5c98012859b9a8b00",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 5,
  )

Service.create!(
    title: "The Florence Dance Festival",
    description: "Molissa, assisted by Christiana Axelsen will be very busy while in Florence, as the week residency will require her to teach contemporary classes, set a new work on the dancers of Toscana Dance HUB, mentor dance musicians of Music HUB and User choreographers, plus rehearse and perform at the Florence Dance Festival.",
    category: category.sample,
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/481/464/84ac7de1832e19a38cb480e70672cd7f_original.jpg?w=680&fit=max&v=1493666758&auto=format&q=92&s=5aa629f3e0622619194178a49a28a02e",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 26,
  )


Service.create!(
    title: "Gravity: The Weighted Blanket",
    description: "Gravity is a premium-grade, therapeutic weighted blanket that harnesses the power of deep touch stimulation – a proven anxiety treatment – to gently distribute deep pressure across your body.",
    category: category.sample,
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/316/565/cff9e7bdc4eb8fefbfb5c0e47e179a43_original.png?w=680&fit=max&v=1492614995&auto=format&lossless=true&s=0cbd8b4a2669c9b24a015a34fa1a3260",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 12,
  )

Service.create(
    title: "Vacillation - Adolescence",
    description: "'Vacillation - Adolescence' is the second in a series of seven short dance films. The story is a snapshot of two teenagers in love and their surge of emotions and insecurities. Performed by two dancers, the story is portrayed through a classical ballet Pas de Deux with the London Thames path providing a wonderful backdrop.",
    category: "film",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/003/775/929/314c481354d012aa67852eea7128c053_original.jpg?w=680&fit=max&v=1431418793&auto=format&q=92&s=832da987e7c9422848130e269bfd3449",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 8,
  )

Service.create(
    title: "DELTA ENDURING TAROT",
    description: "There is a savage beauty in the depths of the swamp. For each drop of blood spilled into those dark waters, the delta rises. She thrives. She continues to resist the encroaching gulf. So too is the way of her people, who despite endless struggle, continue to find love and wonder in the ruins of the natural world.",
    category: "art",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/487/822/bd72e66c4a71a315a9860e1a2afb575b_original.jpg?w=680&fit=max&v=1493695657&auto=format&q=92&s=bbbaffae2b473ccc0c333551e75e6879",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 14,
  )

Service.create(
    title: "The Circuit: Urbiessa",
    description: "The purpose of this Kickstarter is to finance the very first episode of 'The Circuit' anthology. Help us make an incredible episode, and maybe more! It's up to you!",
    category: "film",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/310/749/6ae7ff79ff4f80e98682925be3cf73b0_original.jpg?w=680&fit=max&v=1492575349&auto=format&q=92&s=6b35baca432ba81663600c03f03d3a8c",
    owner: Student.all.sample,
    what_i_need_from_you: Faker::Lorem.paragraph(2),
    what_i_will_do_for_you: "Remember that you are unique. Do not sell yourself short. Do not sell the world short. This is your life – love it, live it. One life, one chance – grab it.",
    price: 12,
  )

puts 'Finished!'

