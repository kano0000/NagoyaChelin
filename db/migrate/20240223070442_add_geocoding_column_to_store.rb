class AddGeocodingColumnToStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :latitude, :float, null: false, default: 0
    add_column :stores, :longitude, :float, null: false, default: 0
  end
end
