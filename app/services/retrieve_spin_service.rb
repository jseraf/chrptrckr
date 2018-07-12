class RetrieveSpinService
  def self.call
    playlist_url = 'https://chirpradio.appspot.com/api/current_playlist?src=chrptrckr'
    @spin   = HTTParty.get(playlist_url)
    process_spin unless self.duplicate?
  end

  private

  def self.duplicate?
    Spin.where(chirp_id: @spin['now_playing']['id']).exists?
  end

  def self.process_spin
    now_playing = @spin['now_playing']

    current_dj  = Dj.find_or_create_by(name: now_playing['dj'])
    Spin.create(dj:              current_dj,
                artist_is_local: now_playing['artist_is_local'],
                track:           now_playing['track'],
                release:         now_playing['release'],
                label:           now_playing['label'],
                notes:           now_playing['notes'],
                lastfm_large_image: now_playing['lastfm_urls']['large_image'],
                played_at:       now_playing['played_at_local'],
                chirp_id:        now_playing['id'])
    Rails.logger.info "#{now_playing['track']} saved"
  end

end
