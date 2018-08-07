class AddLastfmToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :lastfm_url, :string
    add_column :artists, :lastfm_bio, :text
  end
end
