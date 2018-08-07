class AddSpinsCountToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :spins_count, :integer, default: 0

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    # http://ryan.mcgeary.org/2016/02/05/proper-counter-cache-migrations-in-rails/
    execute <<-SQL.squish
        UPDATE artists
           SET spins_count = (SELECT count(1)
                              FROM spins
                              WHERE spins.artist_id = artists.id)
    SQL
  end
end
