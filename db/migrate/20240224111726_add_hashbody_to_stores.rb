class AddHashbodyToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :hashbody, :string
  end
end
