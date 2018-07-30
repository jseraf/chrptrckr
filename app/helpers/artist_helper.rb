module ArtistHelper
  SPIN_COUNT_SCOPES = [
    'today',
    'yesterday',
    'this_week',
    'this_month'
  ]

  SPIN_COUNT_SCOPES.each do |time|
    define_method "#{time}_count" do
      @artist.spins.send("played_#{time}").count
    end
  end
end
