class AddSlugToDjs < ActiveRecord::Migration[5.2]
  def change
    add_column :djs, :slug, :string
    add_index :djs, :slug, unique: true
  end
end
