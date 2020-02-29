# frozen_string_literal: true

10.times do
  dob = Faker::Date.birthday(min_age: 16, max_age: 40)

  Player.create(
    name: Faker::Sports::Football.player,
    dob: dob,
    pob: Faker::Address.city,
    age: Time.now.year - dob.year,
    height: [*170..200].sample,
    position: Faker::Sports::Football.position,
    foot: %w[Left Right Both].sample,
    current_club: Faker::Sports::Football.team
  )
end