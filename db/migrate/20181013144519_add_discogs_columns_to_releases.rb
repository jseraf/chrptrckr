class AddDiscogsColumnsToReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :discogs_id, :bigint
    add_column :releases, :discogs_img, :string
    add_column :releases, :year, :smallint
  end
end
