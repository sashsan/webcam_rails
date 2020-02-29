# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name         { Faker::Sports::Football.player }
    dob          { Faker::Date.birthday(min_age: 16, max_age: 40) }
    pob          { Faker::Address.city }
    age          { Time.now.year }
    height       { [*170..200].sample }
    position     { Faker::Sports::Football.position }
    foot         { %w[Left Right Both].sample }
    current_club { Faker::Sports::Football.team }

    transient do
      picture { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/1.jpg')) }
    end

    after(:create) do |player, option|
      player.picture.attach(option.picture)
    end
  end
end
