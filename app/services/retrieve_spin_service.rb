class RetrieveSpinService
  def self.call
    playlist_url = 'https://chirpradio.appspot.com/api/current_playlist?src=chrptrckr'
    @spin        = HTTParty.get(playlist_url)
    return if self.duplicate?
    process_spin
  end

  private

  def self.duplicate?
    @spin['now_playing']['id'] == Spin.pluck('chirp_id').last
  end

  def self.process_spin
    now_playing = @spin['now_playing']

    dj_id     = Dj.find_or_create_by(name: now_playing['dj'])
    artist_id = Artist.find_or_create_by(name: now_playing['artist'])
    label_id  = Label.find_or_create_by(name: now_playing['label'])

    Spin.create(dj:              dj_id,
                artist:          artist_id,
                artist_is_local: now_playing['artist_is_local'],
                track:           now_playing['track'],
                release:         now_playing['release'],
                label:           label_id,
                notes:           now_playing['notes'],
                lastfm_large_image: now_playing['lastfm_urls']['large_image'],
                played_at:       now_playing['played_at_local'],
                chirp_id:        now_playing['id'])

  end

end
