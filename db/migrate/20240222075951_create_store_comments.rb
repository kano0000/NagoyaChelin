class CreateStoreComments < ActiveRecord::Migration[6.1]
  def change
    create_table :store_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :store_id

      t.timestamps
    end
  end
end
