class AddArtistRefToSpins < ActiveRecord::Migration[5.2]
  def change
    add_reference :spins, :artist, foreign_key: true
  end
end
