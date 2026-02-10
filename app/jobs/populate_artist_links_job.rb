class PopulateArtistLinksJob < ApplicationJob
  queue_as :default

  def perform
    # Update artist links where needed.
    Artist.where(discogs_url: nil).or(Artist.where(lastfm_url: nil)).each do |artist|
      artist.save
      puts "PopulateArtistLinksJob: #{artist.name} saved."
      sleep 4 # prevent discogs throttle
    rescue StandardError
      puts "PopulateArtistLinksJob: #{artist.name} could not be saved."
    end
  end
end
