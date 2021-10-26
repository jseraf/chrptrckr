class RetrieveSpinService
  class << self
    def call
      playlist_url = 'https://chirpradio.appspot.com/api/current_playlist?src=chrptrckr'
      @spin        = HTTParty.get(playlist_url)
      process_spin unless duplicate?
    end

    private

    def duplicate?
      return true if (spin_id_is_duplicate? || last_spin_is_duplicate?)
    end

    def spin_id_is_duplicate?
      Spin.where('chirp_id = ?', @spin['now_playing']['id']).count.positive?
    end

    def last_spin_is_duplicate?
      return false if Spin.count.zero?

      last_spin = Spin.with_artist_label.last

       @spin['now_playing']['artist'] == last_spin.artist.name &&
         @spin['now_playing']['track'] == last_spin.track &&
         @spin['now_playing']['label'] == last_spin.label.name
    end

    def process_spin
      now_playing = @spin['now_playing']

      dj      = Dj.find_or_create_by(name: now_playing['dj'])
      artist  = get_or_create_artist(now_playing['artist'])
      release = get_or_create_release(artist, now_playing) # Release.find_or_create_by(artist_id: artist_id, title: now_playing['release'])
      label   = Label.find_or_create_by(name: now_playing['label'])

      Spin.create(dj:                 dj,
                  artist:             artist,
                  artist_is_local:    now_playing['artist_is_local'],
                  track:              now_playing['track'],
                  release:            release, # now_playing['release']
                  label:              label,
                  notes:              now_playing['notes'],
                  lastfm_large_image: now_playing['lastfm_urls']['large_image'],
                  played_at:          now_playing['played_at_local'],
                  chirp_id:           now_playing['id'])

    end

    def get_or_create_artist(artist)
      if artist.parameterize.blank?
        Artist.where(name: artist).first_or_create(name: artist)
      else
        Artist.where(slug: artist.parameterize).first_or_create(name: artist)
      end
    end

    def get_or_create_release(artist, spin)
      discogs_results = self.get_discogs_release_info(spin).first

      case discogs_results.nil?
      when false
        Release.find_or_create_by(artist: artist,
          title:        spin['release'],
          discogs_id:   discogs_results.id,
          discogs_img:  discogs_results.thumb,
          year:         discogs_results.year)
      else
        Release.find_or_create_by(artist: artist, title: spin['release'])
      end
    end

    def get_discogs_release_info(spin)
      discogs_search_term = spin.select do |term|
                              DiscogsSearch.get_search_fields('release').include?(term)
                            end.values.join(' - ')
      DiscogsSearch.call(search_term: discogs_search_term,
        search_type: 'release').results
    end
  end
end
