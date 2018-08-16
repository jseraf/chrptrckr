class AddDiscogsToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :discogs_url, :string
  end
end
