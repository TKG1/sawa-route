class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :schedule, null: false, default: 0
      t.integer :level, null: false, default: 0
      t.string :time, null: false
      t.float :length, null: false
      t.string :image
      t.references :mountain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
