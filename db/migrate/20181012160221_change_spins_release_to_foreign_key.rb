class ChangeSpinsReleaseToForeignKey < ActiveRecord::Migration[5.2]
  def change
    rename_column :spins, :release, :release_id
    change_column :spins, :release_id, 'bigint USING CAST (release_id AS bigint)'
    add_foreign_key :spins, :releases, column: :release_id
    add_index :spins, :release_id
  end
end
