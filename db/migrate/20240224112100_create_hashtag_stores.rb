class CreateHashtagStores < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtag_stores do |t|
      t.references :store, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
