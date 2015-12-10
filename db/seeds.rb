User.create!(name:  "Max",
             email: "max@hello.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Troy",
            email: "troy@hello.com",
            password:              "password",
            password_confirmation: "password",
            activated: true,
            activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

#
# users = User.order(:created_at).take(6)
# 3.times do
#   name = Faker::Lorem.sentence(1)
#   desc =Faker::Lorem.sentence(6)
#   zoom = 60000
#   center_lat = 0-rand(90) + rand(90)
#   center_long = 0-rand(180) + rand(180)
#   movement_strength = rand(100)/100.0
#
#   users.each { |user| user.movements.create!(name: name, desc: desc, zoom: zoom,
#                                              movement_strength: movement_strength,
#                                               center_lat: center_lat, center_long: center_long)}
# end