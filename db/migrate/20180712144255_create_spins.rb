class CreateSpins < ActiveRecord::Migration[5.2]
  def change
    create_table :spins do |t|
      t.references :dj, foreign_key: true
      t.boolean :artist_is_local, default: false
      t.string :track
      t.string :release
      t.string :label
      t.text :notes
      t.string :lastfm_large_image
      t.timestamp :played_at
      t.string :chirp_id

      t.timestamps
    end
  end
end
