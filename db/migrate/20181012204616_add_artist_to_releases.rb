class AddArtistToReleases < ActiveRecord::Migration[5.2]
  def change
    add_reference :releases, :artist, foreign_key: true
  end
end
