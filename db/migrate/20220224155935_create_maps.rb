class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.decimal :latitude, null: false,  precision: 9, scale: 6
      t.decimal :longitude, null: false, precision: 9, scale: 6
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
