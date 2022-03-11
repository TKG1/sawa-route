class AddColumnZoomToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :zoom, :integer, default: 12
  end
end
