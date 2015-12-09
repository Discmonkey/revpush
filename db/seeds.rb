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

locations = ["New York, NY", "Dallas, Texas", "255 HollyRidge Roswell, GA", "27 Lakeview Terrace Oakland, NJ,", "4900 Central Drive Stone Moutain, GA",
                  "Gwinnet County, GA"]

users = User.order(:created_at).take(6)
3.times do
  name = Faker::Lorem.sentence(1)
  desc =Faker::Lorem.sentence(6)
  zoom = rand(10)/10.0
  address = locations.sample
  movement_color = "#ffffff"
  movement_strength = rand(100)/100.0

  users.each { |user| user.movements.create!(name: name, desc: desc, zoom: zoom, Address: address, movement_strength: movement_strength,
                                              movement_color: movement_color)}
end