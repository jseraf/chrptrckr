FactoryBot.define do
  factory :spin do
    track "MyString"
    notes "MyText"
    artist_is_local false
    label "MyString"
    release "MyString"
    lastfm_large_image "http://lastfm"
    played_at "2018-07-12 09:43:33"
    chirp_id "MyString"

    # factory :spin_with_dj_id do
    #   # this is not a real scenario
    #   association :dj, factory: :dj
    # end

    # factory :spin_with_new_dj do
    #   dj 'DJ Jay'
    # end

    # factory :spin_with_local do
    #   artist_is_local
    # end

  end
end
