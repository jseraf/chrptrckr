class CreateDjs < ActiveRecord::Migration[5.2]
  def change
    create_table :djs do |t|
      t.string :name

      t.timestamps
    end
    add_index :djs, :name
  end
end
