FactoryBot.define do
  factory :spin do
    sequence(:track)    { |n| "Track #{n}" }
    notes               { Faker::Lorem.sentence }
    artist_is_local     { false }
    sequence(:label)    { |n| "Label #{n}" }
    sequence(:release)  { |n| "Release #{n}" }
    lastfm_large_image  { "http://lastfm/" }
    played_at           { DateTime.current }
    sequence(:chirp_id) { |n| "UUID #{n}" }

    trait :local_artist do
      artist_is_local { true }
    end

    factory :local_spin,    traits: %i[local_artist]
  end
end
