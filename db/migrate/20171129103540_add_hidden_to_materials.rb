class AddHiddenToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :hidden, :boolean, default: false, null: false
  end
end
