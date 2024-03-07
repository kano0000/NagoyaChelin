class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :store_id
      t.text :report

      t.timestamps
    end
  end
end
