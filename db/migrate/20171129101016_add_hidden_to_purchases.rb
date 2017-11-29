class AddHiddenToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :hidden, :boolean, default: false, null: false
  end
end
