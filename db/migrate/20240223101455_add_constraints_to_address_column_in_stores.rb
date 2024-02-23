class AddConstraintsToAddressColumnInStores < ActiveRecord::Migration[6.1]
  def up
    change_column :stores, :address, :string, null: false, default: ""
  end
end
