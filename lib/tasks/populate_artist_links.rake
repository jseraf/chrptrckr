namespace :artists do

  desc 'Re-save artist to update links.'
  task :external_links => :environment do
    Artist.where(discogs_url: nil).or(Artist.where(lastfm_url: nil)).each do |artist|
      begin
        artist.save
        puts "#{artist.name} saved."
        sleep 4 # prevent discogs throttle
      rescue
        puts "#{artist.name} could not be saved."
      end
    end
  end
end
