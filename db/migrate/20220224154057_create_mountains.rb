class CreateMountains < ActiveRecord::Migration[6.1]
  def change
    create_table :mountains do |t|
      t.string :name, null: false
      t.string :image
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
