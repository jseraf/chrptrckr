class AddSpinsCountToReleasesAndDjs < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :spins_count, :integer, default: 0
    add_column :djs, :spins_count, :integer, default: 0
  end
end
