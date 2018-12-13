module ArtistHelper
  SPIN_COUNT_SCOPES = %w[
    today
    yesterday
    this_week
    this_month
    last_month
  ]

  SPIN_COUNT_SCOPES.each do |time_frame|
    define_method "#{time_frame}_count" do
      @artist.spins.send("played_#{time_frame}").count
    end

    define_method "most_played_#{time_frame}" do
      Artist.joins(:spins).merge(Spin.send("played_#{time_frame}")).group(:name, :id).count.sort_by { |artist, count| count }.reverse.take(10).to_h
    end
  end
end
